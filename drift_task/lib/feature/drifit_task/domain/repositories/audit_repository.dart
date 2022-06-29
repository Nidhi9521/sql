import 'package:dartz/dartz.dart';
import 'package:drift_task/core/failure.dart';
import 'package:drift_task/feature/drifit_task/data/data_sources/database/drifit_database.dart';

abstract class AuditRepository {

  Future<Either<Failure, List<Audit>>> getAudit();
  Future<Either<Failure, void>> updateAudit(Audit auditEntities);
  Future<Either<Failure, void>> addAudit();
  Future<Either<Failure, void>> deleteAudit(Audit auditEntities);

}