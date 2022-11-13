const mongoose = require("mongoose");

const signUpSchema = mongoose.Schema({
  name: { 
    type: String, 
    required: true, 
    trim: true, 
        },
  email: { 
    type: String, 
    required: true,
    validate:{
        validator:(value)=>{
            const re =
            /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return value.match(re);
        },
        message:'Please enter a valid Email address'

    }
        },
    password: { 
        type: String, 
        required: true,
        },
});

const signUpModel = mongoose.model("signUpModel", signUpSchema);

module.exports = signUpModel;
