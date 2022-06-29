

import 'package:drift_task/feature/drifit_task/data/data_sources/database/drifit_database.dart';
import 'package:drift/drift.dart';

part 'audit_dao.g.dart';
@DriftAccessor(tables:[AuditTable])

class AuditDao extends DatabaseAccessor<AppDatabase> with _$AuditDaoMixin {
  final AppDatabase db;

  AuditDao(this.db) : super(db);

  Future<List<Audit>> watchAllEmployee() => select(auditTable).get();

  Future<void> insertEmployee(
      List<AuditTableCompanion> employeeDetails) async {
    await batch((batch) {
      batch.insertAll(auditTable, employeeDetails);
    });
  }
  Future updateEmployee(Insertable<Audit> auditDetails) =>
      update(auditTable).replace(auditDetails);

  Future deleteEmployee(Insertable<Audit> auditDetails) =>
      delete(auditTable).delete(auditDetails);
}