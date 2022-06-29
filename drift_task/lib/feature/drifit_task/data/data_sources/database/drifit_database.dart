import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_task/feature/drifit_task/data/data_sources/dao/audit_dao.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'drifit_database.g.dart';

@DataClassName('Audit')
class AuditTable extends Table {
  IntColumn get AuditEntityId => integer().nullable()();
  IntColumn get AuditId => integer().nullable()();
  TextColumn get AuditEntityName => text().nullable()();
  IntColumn get AuditEntityTypeId => integer().nullable()();
  IntColumn get AuditParentEntityId => integer().nullable()();
  IntColumn get SequenceNo => integer().nullable()();
  TextColumn get EntityEndDate => text().nullable()();
  BoolColumn get IsLeafNode => boolean().nullable()();
  TextColumn get BarcodeNFC => text().nullable()();
  IntColumn get EntityLevel => integer().nullable()();
  BoolColumn get EntityException => boolean().nullable()();
  TextColumn get ScheduleOccurrenceIds => text().nullable()();

  @override
  Set<Column> get primaryKey => {AuditEntityId};
}

@DriftDatabase(tables: [AuditTable], daos: [AuditDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

}
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'audit.db'));
    return NativeDatabase(file);
  });
}