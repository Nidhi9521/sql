import 'package:dartz/dartz.dart';
import 'package:drift_task/core/UseCase.dart';
import 'package:drift_task/core/failure.dart';
import 'package:drift_task/feature/drifit_task/data/data_sources/database/drifit_database.dart';
import 'package:drift_task/feature/drifit_task/domain/repositories/audit_repository.dart';

class UpdateAuditUsecase extends UseCase<void,Audit>{
  AuditRepository auditRepository;
  UpdateAuditUsecase(this.auditRepository);

  @override
  Future<Either<Failure, void>> call(Audit params) {
    print(params);
    print('usecase');
    return  auditRepository.updateAudit(params);
  }

}