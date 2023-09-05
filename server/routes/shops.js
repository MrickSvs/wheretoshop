const express = require('express');
const router = express.Router();
const Shop = require('../models/shops');

router.get('/', async (req, res) => {
  try {
    const style = req.query.style;
    let shops;
    if (style) {
      shops = await Shop.find({ style });
    } else {
      shops = await Shop.find();
    }
    res.json(shops);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
