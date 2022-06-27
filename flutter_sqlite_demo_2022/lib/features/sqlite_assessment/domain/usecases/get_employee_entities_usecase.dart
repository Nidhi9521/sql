import 'package:dartz/dartz.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';

import '../../data/datasources/local/database/drift_database.dart';
import '../entities/employee_entities.dart';
import '../repositories/employee_entities_repository.dart';

class GetEmployeeEntities extends UseCase<List<Employee?>, NoParams> {
  final EmployeeRepository repository;

  GetEmployeeEntities(this.repository);

  @override
  Future<Either<Failure, List<Employee?>>?>? call(NoParams params) async {
    return await repository.getEmployeeEntities();
  }
}
