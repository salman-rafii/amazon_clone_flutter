const jwt = require('jsonwebtoken');
const User = require('../models/user.model');

const admin = async(req, res, next) => {
try {
    const token = req.header('x-auth-token');
    if(!token) return res.status(401).json({msg:"No auth token, access denied!"});
    const isVerified = jwt.verify(token, "passwordKey");
    if(!isVerified) return res.status(401).json({msg:"token verification failed, authorization denied!"})
    const user = User.findById(isVerified.id);
    if(user.type == "user" || user.type == "seller"){
        res.status(500).json({msg:"You are not an admin!"})
    }
    req.user = isVerified.id;
    req.token = token;
    next();
} catch (error) {
    res.json(500).json({error:error.message})
}
}

module.exports = admin;