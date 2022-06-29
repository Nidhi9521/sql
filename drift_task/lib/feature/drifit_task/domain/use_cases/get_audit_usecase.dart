import 'package:dartz/dartz.dart';
import 'package:drift_task/core/UseCase.dart';
import 'package:drift_task/core/failure.dart';
import 'package:drift_task/feature/drifit_task/data/data_sources/database/drifit_database.dart';
import 'package:drift_task/feature/drifit_task/domain/repositories/audit_repository.dart';

class GetAuditUsecase extends UseCase<void,NoParams>{
  final AuditRepository repository;
  GetAuditUsecase(this.repository);

  @override
  Future<Either<Failure, List<Audit>>> call(NoParams params) async{
    print('usecase');
   return await repository.getAudit();
  }
}