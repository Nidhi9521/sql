import 'package:dartz/dartz.dart';
import 'package:sqlite_assessment/core/error/failures.dart';

import '../../data/datasources/local/database/drift_database.dart';
import '../entities/employee_entities.dart';


abstract class EmployeeRepository {
  Future<Either<Failure, List<Employee?>>?>? getEmployeeEntities();
  Future<Either<Failure, void>?>? updateEmployeeEntities(Employee auditEntities);
  Future<Either<Failure, void>?>? addEmployeeEntities();
  Future<Either<Failure, void>?>? deleteEmployeeEntities(Employee auditEntities);
}
