import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import '../../domain/entities/employee_entities.dart';
import '../../domain/repositories/employee_entities_repository.dart';
import '../models/employee_model.dart';


class EmployeeRepositoryImpl implements EmployeeRepository {
  final AppDatabase appDatabase;

  EmployeeRepositoryImpl({required this.appDatabase});

  @override
  Future<Either<Failure, void>?>? addEmployeeEntities() async {
    try {
      var jsonText = await rootBundle.loadString('assets/entity.json');
      Map<String, dynamic> map = json.decode(jsonText);
      List<dynamic> data = map["auditEntity"];
      List<EmployeesModel> subList = data.map((e) => EmployeesModel.fromJson(e)).toList();
      List<EmployeeTableCompanion> list = [];

      for (var element in subList) {
        final data = EmployeeTableCompanion.insert(
          employeeId: Value(element.employeeId),
          employeeName: Value(element.employeeName),
          employeeSalary: Value(element.employeeSalary),
          employeeJoiningDate: Value(element.employeeJoiningDate),
        );
        list.add(data);
      }
      final add = await appDatabase.employeeDao.insertEmployee(list);
      return Right(add);
    } catch (e) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>?>? deleteEmployeeEntities(Employee employeeDetails) async {
    final delete = await appDatabase.employeeDao.deleteEmployee(employeeDetails);
    return Right(delete);
  }

  @override
  Future<Either<Failure, List<Employee>>?>? getEmployeeEntities() async {
    try{
      final get = await appDatabase.employeeDao.watchAllEmployee();
      return Right(get);
    }on Exception{
      return Left(LocalFailure());
    }
  }


  @override
  Future<Either<Failure, void>?>? updateEmployeeEntities(Employee employeeDetails) async {
    final update = await appDatabase.employeeDao
        .updateEmployee(employeeDetails);
    return Right(update);
  }

}

