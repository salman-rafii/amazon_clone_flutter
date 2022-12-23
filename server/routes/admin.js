const express = require('express');
const admin = require('../middlewares/admin');

const adminRouter = express.Router();


// Add Product
adminRouter.post('/admin/add-product',admin, async (req,res)=>{

    try {
        const {name, description, quantity, images, price,category} = req.body;
    } catch (error) {
        res.status(500).json({error:error.message})
    }

});