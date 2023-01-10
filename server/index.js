// IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const cors = require('cors')

// IMPORT FROM OTHER FILES
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');


// INIT
const PORT = process.env.PORT || 3000;
const app  = express()
const DB ="mongodb+srv://salmanrafi125:Salman123!@cluster0.lso4jp1.mongodb.net/?retryWrites=true&w=majority";
dotenv.config();



// MIDDLEWARE
app.use(express.json());
app.use(cors());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter)


// Connections
mongoose.connect(DB).then(()=>{
    console.log('MONGODB Connected')
}).catch(()=>{
console.log("Error ");
})

// Server Start
app.listen(PORT,"0.0.0.0", ()=>{
    console.log(`Connected at Port ${PORT}`)
})