const mongoose = require("mongoose");
const employeeModel = require("../../model/employess");
const e = require("express");


class EmployeeDomain {
    getAllEmployees(req, res) {
        var data = employeeModel.find({}, function (err, result) {
            res.send(result);
        });
    }

    getAnEmployee(req, res) {
        var data = employeeModel.find({ EmpId: req.params.EmpId }, function (err, result) {
            res.send(result);
        });
    }

    getAnAssignment(req, res) {
        console.log(req.params.EmpId);
        console.log(req.params.aid);
        var query = { EmpId: req.params.EmpId }
        employeeModel.find({ EmpId: req.params.EmpId }, 
            {Assignments: {$elemMatch: {AssignmentId: req.params.aid}}, _id:0}, function (err, result) {
            res.send(result);
        });
    }
    async postEmployee(req, res) {
        console.log(req.body);
        var data = new employeeModel(req.body);
        try {
            await data.save();
            res.send('success');
            //res.end();
        }
        catch(err){
          //  res.send(err.message);
          console.log(err);
            //res.end();
        }    
        res.end();    

        // data.save().then(
        //     res.send('success')
        // ).catch(
        //     res.send(err.message)
        // )
    }

    deleteEmployee(req,res){
        console.log(req.params.EmpId);
        var query={EmpId:req.params.EmpId}
        employeeModel.deleteOne(query,function (err,result) {

            if(err){
                res.send('failure');
            }else{
                res.send('success');
            }
            
        })
    }
}

module.exports = EmployeeDomain;