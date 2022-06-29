import 'package:dartz/dartz.dart';
import 'package:drift_task/core/UseCase.dart';
import 'package:drift_task/core/failure.dart';
import 'package:drift_task/feature/drifit_task/data/data_sources/database/drifit_database.dart';
import 'package:drift_task/feature/drifit_task/domain/repositories/audit_repository.dart';

class DeleteAuditUsecase extends UseCase<void,Audit>{
  final AuditRepository auditRepository;
  DeleteAuditUsecase(this.auditRepository);
  @override
  Future<Either<Failure, void>> call(Audit params) {
    print('usecase');
    return  auditRepository.deleteAudit(params);
    // return Right(null);
    throw UnimplementedError();
  }


}