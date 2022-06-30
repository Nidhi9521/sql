const express = require("express");
var createError=require("http-errors");
const login=require('./controller/login/login.controller')

const emplyees = require("./controller/employees/employee.controller");
const students = require("./controller/student/student.controller");
const verifytoken=require('./authentication/verifytoken')
const app=express();
app.use(express.json())
const port = 3000;

app.get("/", (req, res) => {
    res.send("Hello World!");
  });

// app.use("/login",login);
// app.use(verifytoken);
app.use("/students", students);
app.use("/emps", emplyees);
// app.use(function (err,req,res,next) {
//     next(createError(404));
// })
app.listen(port,()=>{
    console.log(`app listening at http://localhost:${port}`);
})