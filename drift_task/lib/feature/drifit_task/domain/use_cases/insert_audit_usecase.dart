import 'package:dartz/dartz.dart';
import 'package:drift_task/core/UseCase.dart';
import 'package:drift_task/core/failure.dart';
import 'package:drift_task/feature/drifit_task/domain/repositories/audit_repository.dart';

class InsertAuditUsecase extends UseCase<void,NoParams>{
  final AuditRepository repository;
  InsertAuditUsecase(this.repository);
  @override
  Future<Either<Failure, void>> call(NoParams params)async{
    print('usecase');
    return await repository.addAudit();
  }
}