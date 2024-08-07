const express = require('express');
const bodyParser = require('body-parser');
const db = require('./config/db.config');
const { v4: uuidv4 } = require('uuid');
const { format } = require('date-fns');
const { id } = require('date-fns/locale');

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    res.send('...');
});

app.get('/order-details/:id', (req, res) => {
    const orderNumber = req.params.id;
    const query = `
        SELECT 
            a.order_number, 
            b.name as orderan, 
            g.table_dine as meja, 
            c.name as tipe, 
            e.name as category, 
            c.price as harga, 
            CASE WHEN c.diskon IS NULL THEN c.price ELSE (c.price - c.diskon) END AS total_harga,
            f.name as station
        FROM 
            bill_transaction AS a 
        LEFT JOIN 
            list_product AS b 
        ON 
            b.order_id = a.order_number 
        LEFT JOIN 
            type_product AS c 
        ON 
            c.id = b.type 
        LEFT JOIN 
            category_product AS e 
        ON 
            e.id = b.category 
        LEFT JOIN 
            station_printer AS f 
        ON 
            f.station = e.station 
        LEFT JOIN 
            table_customer AS g 
        ON 
            g.id = b.dine 
        WHERE 
            a.order_number = ?
    `;
    
    db.query(query, [orderNumber], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }

        const total_harga = result.reduce((sum, item) => sum + parseFloat(item.total_harga), 0);
        const format_rupiah = new Intl.NumberFormat('id-ID', {
            style: 'currency',
            currency: 'IDR',
        }).format(total_harga);

        res.json({
            data: result,
            total_harga: format_rupiah
        });
        // res.json(result);
    });
});

app.post('/orders', (req, res) => {
    const { name, dine, type, category } = req.body;
    // const created_date = new Date().toISOString().slice(0, 19).replace('T', ' ');
    const created_date = format(new Date(), 'yyyy-MM-dd HH:mm:ss', { locale: id });
    db.query('SELECT order_id FROM list_product WHERE dine = ? LIMIT 1', [dine], (err, result) => {
        if (err) {
            console.error('error ', err);
        }

        let order_id;
        if (result.length > 0) {
            order_id = result[0].order_id;
        } else {
            order_id = `TRX${Date.now()}${uuidv4()}`;

            const orderDetailQuery = 'INSERT INTO bill_transaction (order_number, create_date) VALUES (?, ?)';
            const orderDetailValues = [order_id, created_date];

            db.query(orderDetailQuery, orderDetailValues, (err) => {
                if (err) {
                    console.error('error ', err);
                }
            });
        }

        db.query('INSERT INTO list_product (name, order_id, dine, type, category, create_date) VALUES (?, ?, ?, ?, ?, ?)',
            [name, order_id, dine, type, category, created_date], (err, result) => {
                if (err) {
                    console.error('error ', err);
                }

                const insertOrderId = result.insertId;
                const selectQuery = `
                    SELECT a.order_id, f.table_dine as nomor_meja, a.name as orderan, b.name as tipe, c.name as kategori, b.price as harga, d.name as station
                    FROM list_product as a
                    JOIN type_product as b ON b.id = a.type
                    JOIN category_product as c ON c.id = a.category
                    JOIN station_printer as d ON d.station = c.station
                    JOIN table_customer as f ON f.id = a.dine
                    LEFT JOIN bill_transaction as e ON e.order_number = a.order_id
                    WHERE a.id = ?
                `;

                db.query(selectQuery, [insertOrderId], (err, results) => {
                    if (err) {
                        console.error('error ', err);
                    }

                    res.status(201).json({
                        message: `order berhasil: ${insertOrderId}`,
                        data: results
                    });
                });
            });
    });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
