const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'data'
});

connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL Database!');
});

module.exports = connection;