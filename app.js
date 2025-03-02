const express = require('express');
const app = express();

app.use(express.json());

app.get('/api', (req, res) => {
    res.json({ message: 'Hello, World!' });
});

app.post('/api', (req, res) => {
    const data = req.body;
    res.status(201).json({ received: data });
});

app.listen(3000, () => {
    console.log('Server running on port 3000');
});