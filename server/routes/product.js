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
  
 productRouter.get('/api/products/search/:name', async(req,res)=>{
try {
    const product = await Product.find({
        name:{
            $regex:req.params.name, $options:'i',
        }
    })
    res.json(product);    
} catch (error) {
    res.status(500).json({error:error.message});
}
 }); 


module.exports = productRouter;