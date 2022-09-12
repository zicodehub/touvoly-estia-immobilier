const express = require('express');
const db = require('../db')

const TABLE_NAME = 'visite';
var Model = db.model({
    table: TABLE_NAME
});

// db.begin().then(() => {
//     var bob = person({name: 'bob'});
//     return bob.save();
//   }).then(() => {
//     db.rollback();
//     // or
//     db.commit();
//   });

const router = express.Router();

// Create
router.post('/', async (req, res) => {
    var clt = Model(req.body);
    clt.insert()
    res.send(clt)
});

// Read
router.get('/:id', async (req, res) => {
    const id = req.params.id
    const list = await db.query(`select * from ${TABLE_NAME} where id = @id`, {id: id})
    
    res.send(list[0]);
});

// Update
router.patch('/:id', async (req, res) => {
    const id = req.params.id
    var clt = Model(req.body);
    clt.save()
    res.send(clt)
});

// Delete
router.delete('/:id', async (req, res) => {
    const id = req.params.id
    const item = await db.query(`select * from ${TABLE_NAME} where id = @id`, {id: id})[0]
    await db.query(`delete from ${TABLE_NAME} where id = @id `, { id: id })
    res.send(item)
});

// List
router.get('/', async (req, res) => {
    const list = await db.query(`select * from ${TABLE_NAME}`)
    res.send(list);
});




module.exports = router;
