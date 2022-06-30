const express = require('express')
var router=express.Router();
var StudentDomain=require('../../domain/controller.domain/student.domain')

class StudentController{
    static async get(req,res){
        const studentDomain=new StudentDomain();
        studentDomain.getAllStudent(req,res);
    }
    static async getStudentRecord(req, res) {
        const studentDomain = new StudentDomain();
        studentDomain.getStudentRecord(req, res);
    }
    static async getStudentResult(req, res) {
        const studentDomain = new StudentDomain();
        studentDomain.getStudentResult(req, res);
    }
    static async getStudentFees(req, res) {
        const studentDomain = new StudentDomain();
        studentDomain.getStudentFees(req, res);
    }
}

router.get("/", StudentController.get);
router.get("/:sId", StudentController.getStudentRecord);
router.get("/:sId/result", StudentController.getStudentResult);
router.get("/:sId/fees", StudentController.getStudentFees);
module.exports = router;