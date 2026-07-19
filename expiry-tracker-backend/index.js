const express = require('express');
const pool = require('./db');
const cors = require('cors');
const app = express();
 app.use(cors());
app.use(express.json());

// CREATE: Add a new item
app.post('/items', async (req, res) => {
    const { name, category, expiry_date } = req.body;
    try {
        const result = await pool.query(
            'INSERT INTO inventory (name, category, expiry_date) VALUES ($1, $2, $3) RETURNING *',
            [name, category, expiry_date]
        );
        res.status(201).json(result.rows[0]);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// READ: Get all items
app.get('/items', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM inventory');
        res.json(result.rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// UPDATE: Mark an item as consumed
app.put('/items/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await pool.query('UPDATE inventory SET is_consumed = TRUE WHERE id = $1', [id]);
        res.json({ message: "Item marked as consumed" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// DELETE: Remove an item
app.delete('/items/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await pool.query('DELETE FROM inventory WHERE id = $1', [id]);
        res.json({ message: "Item deleted" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.listen(3000, () => console.log('Server running on http://localhost:3000'));