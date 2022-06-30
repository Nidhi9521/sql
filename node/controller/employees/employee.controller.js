var express=require("express")
var EmployeeDomain=require("../../domain/controller.domain/employess.domain");
const router = express.Router();

class EmployeeController{

    static async get(req,res){
        const employeeDomain = new EmployeeDomain();
        employeeDomain.getAllEmployees(req,res);
    }

    static async getAnEmployee(req,res){
        const employeeDomain = new EmployeeDomain();
        employeeDomain.getAnEmployee(req,res);
    }

    static async getAnEmployeeAssignment(req,res){
        const employeeDomain=new EmployeeDomain();
        employeeDomain.getAnAssignment(req,res);
    }

    static async postEmp(req,res){
        console.log("log");
        const employeeDomain=new EmployeeDomain();
        employeeDomain.postEmployee(req,res);
    }

    static async deleteEmp(req,res){
        console.log("delete");
        const employeeDomain=new EmployeeDomain();
        employeeDomain.deleteEmployee(req,res);
    }
}
router.delete("/:EmpId/delete",EmployeeController.deleteEmp);
router.get("/:EmpId",EmployeeController.getAnEmployee);
router.get('/',EmployeeController.get)
router.get('/:EmpId/assignment/:aid',EmployeeController.getAnEmployeeAssignment);
router.post('/post',EmployeeController.postEmp);

module.exports=router;