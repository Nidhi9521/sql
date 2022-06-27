
import 'package:dartz/dartz.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';

import '../repositories/employee_entities_repository.dart';

class AddEmployeeEntities extends UseCase<void, NoParams> {
  final EmployeeRepository repository;

  AddEmployeeEntities(this.repository);

  @override
  Future<Either<Failure, void>?>? call(NoParams params) async {
    return await repository.addEmployeeEntities();
  }
}
