const express = require('express');

const productRouter = express.Router();
const auth = require('../middlewares/auth_middleware');
const Product = require('../models/product.model');


productRouter.get("/api/products/", auth, async (req, res) => {
    try {
      const products = await Product.find({ category: req.query.category });
      res.json(products);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  


module.exports = productRouter;