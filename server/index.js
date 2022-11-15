// IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const cors = require('cors')

// IMPORT FROM OTHER FILES
const authRouter = require('./routes/auth')


// INIT
const PORT = 3000;
const app  = express()
dotenv.config();



// MIDDLEWARE
app.use(express.json());
app.use(cors());
app.use(authRouter);


// Connections
mongoose.connect(process.env.DB).then(()=>{
    console.log('MONGODB Connected')
}).catch(()=>{
console.log(e);
})

// Server Start
app.listen(PORT,"0.0.0.0", ()=>{
    console.log(`Connected at Port ${PORT}`)
})