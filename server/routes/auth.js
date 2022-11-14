const express = require('express');
const { restart } = require('nodemon');
const User = require('../models/user.model');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const authRouter = express.Router();


// SIGN UP API
authRouter.post('/api/signup',async(req,res)=>{
   try {
     // get the data from client
     const {name,email,password} = req.body;
     // checking if the user exists 
    const existingUser = await User.findOne({email})
    if(existingUser){
     return res.status(400).json({msg:"User with same Email Already Exists"})
    }

    const hashedPassword = await bcryptjs.hash(password,8);
   
    // create the user
    let user = new User({
     name, 
     email,
     password: hashedPassword
    });
 
    // save that data to the database
    user = await user.save();
     // return that data to the user
     res.json(user)
   } catch (e) {
    res.status(500).json({error:e.message});
   }
})

// SIGN IN API(ROUTE)
authRouter.post('/api/signin', async(req,res)=>{
  try {
    const {email, password} = req.body;

    const user = await User.findOne({email})
    if(!user){
      return res.status(400).json({msg:"User Not Found! Please create a new one"})
    }

   const isPasswordMatch = await bcryptjs.compare(password, user.password);
   if(!isPasswordMatch){
    return res.status(400).json({msg:"Password is incorrect!Please try again"})
   }

   const token = jwt.sign({ id: user._id }, "passwordKey");
   res.json({token, ...user._doc})
  } catch (error) {
    res.status(500).json({error:e.message})
  }
})

module.exports = authRouter;