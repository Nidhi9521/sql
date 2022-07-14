import 'package:api_calling_demo/core/failure.dart';
import 'package:api_calling_demo/feature/api_calling/data/models/employeeModel.dart';
import 'package:dartz/dartz.dart';

abstract class EmployeeRepository{
  Future<Either<Failure,List<EmployeeModel>>> getAllData();
  Future<Either<Failure,EmployeeModel>> getPartData(int id);
  Future<Either<Failure,List<EmployeeModel>>> deleteData(EmployeeModel employeeModel);
  Future<Either<Failure,List<EmployeeModel>>> postData(EmployeeModel employeeModel);
  Future<Either<Failure,List<EmployeeModel>>> updateData(EmployeeModel employeeModel);
}