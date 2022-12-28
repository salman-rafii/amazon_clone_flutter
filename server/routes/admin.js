const express = require('express');
const { default: mongoose } = require('mongoose');
const admin = require('../middlewares/admin');
const Product = require('../models/product.model');

const adminRouter = express.Router();


// Add Product
adminRouter.post('/admin/add-product',admin, async (req,res)=>{

    try {
        const { name, description, quantity, images, price,category } = req.body;
        let product = new Product({
            name, 
            description,
            quantity,
            images,
            price,
            category
        });
        product = await product.save();
        res.json(product);
    } catch (error) {
        res.status(500).json({error:error.message})
    }

});

// get all products

adminRouter.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


// delete the products

adminRouter.post('/admin/delete-product',admin,async(req,res)=>{
try {
  const {id } = req.body;
  let product = await Product.findByIdAndDelete(id);

  res.json(product)
  // res.json({msg:"Product Deleted Successfully!"})
} catch (error) {
  res.status(500).json({error:error.message})
}
})


module.exports = adminRouter;