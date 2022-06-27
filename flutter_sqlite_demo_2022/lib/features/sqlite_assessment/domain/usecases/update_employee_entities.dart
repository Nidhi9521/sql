import 'package:dartz/dartz.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';

import '../../data/datasources/local/database/drift_database.dart';
import '../entities/employee_entities.dart';
import '../repositories/employee_entities_repository.dart';

class UpdateEmployeeEntities extends UseCase<void, Employee> {
  final EmployeeRepository repository;

  UpdateEmployeeEntities(this.repository);

  @override
  Future<Either<Failure, void>?>? call(Employee params) async {
    return await repository.updateEmployeeEntities(params);
  }
}
