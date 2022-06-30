var express =require("express");
var router=express.Router();
const jwt= require("jsonwebtoken");
const config=require("../../authentication/global.config")

router.post("/",(req,res)=>{
    let userdata = { 
        username:req.body.username,
        password:req.body.password,
    };

    console.log(userdata);
    
    let token=jwt.sign(userdata,config.secretKey,{
        algorithm:config.algorithm,
        expiresIn:"1d",
    });
    console.log(token);

    if(userdata.username=="admin" && userdata.password=="admin"){
        res.status(200).json({
            message:"Login Successful",
            jwttoken:token,
        });
    }else{
        res.status(401).json({
            message: "Login Failed",
        });
    }
});

module.exports = router;