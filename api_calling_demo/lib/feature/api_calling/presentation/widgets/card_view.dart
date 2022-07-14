import 'package:api_calling_demo/feature/api_calling/data/models/employeeModel.dart';
import 'package:flutter/material.dart';
class CardView extends StatelessWidget {
  const CardView({Key? key, required this.employeeModel}) : super(key: key);
  final EmployeeModel employeeModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black26,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(45)
          ),
        ),
        title: Text('Name: ${employeeModel.firstName.toString()} ${employeeModel.lastName.toString()}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        subtitle: Text('Employee Id: ${employeeModel.empId.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    );
  }
}