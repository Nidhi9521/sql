
const mongoose = require("mongoose");
const studentModel=require("../../model/student");

class StudentDomain{

    getAllStudent(req,res){
        var data=  studentModel.find({},function(err,result){
            res.send(result);
        });
    }

    getStudentRecord(req,res){
        var data = studentModel.find({ID:req.params.sId},function(err,result){
            res.send(result);
        });
    }

    getStudentResult(req,res){
        var data = studentModel.find({ID:req.params.sId},{Result:1,_id:0},function(err,result){
            res.send(result);
        });

    }
    
    getStudentFees(req,res){
        var data = studentModel.find({ID:req.params.sId},{Fees:1,_id:0},function(err,result){
            res.send(result);
        });
    }

}

module.exports=StudentDomain;