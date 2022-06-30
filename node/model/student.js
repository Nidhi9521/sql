const mongoose = require("mongoose");
mongoose.connect("mongodb://localhost:27017/mydata", () => { console.log("db") })
const student = new mongoose.Schema(
    {
        "ID": { type: Number, required: true },
        "Name": { type: String, required: true },
        "Address": { type: String, required: true },
        "Fees": {
            "Amount": { type: Number, required: true },
            "PaymentDate": { type: Date, required: true },
            "Status": { type: Boolean, required: true },
        },
        "Result": {
            "Hindi": { type: Number, required: true },
            "Eng": { type: Number, required: true },
            "Math": { type: Number, required: true },
            "Total": { type: Number, required: true },
            "Grade": { type: String, required: true },
        }
    }
);


const studentModel = mongoose.model("student", student);

module.exports = studentModel;