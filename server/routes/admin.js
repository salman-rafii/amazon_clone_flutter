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

adminRouter.get("/admin/get-products", admin, (req,res)=>{
    try {
        const product = Product.find({});
        if(!product) res.status(404)
        res.json(product)
    } catch (error) {
        res.status(500).json({error:error.message})
    }
})



module.exports = adminRouter;