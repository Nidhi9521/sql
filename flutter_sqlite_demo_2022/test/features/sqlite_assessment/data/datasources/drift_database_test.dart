


import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';

/*
@Skip("sqflite cannot run on the machine")
class MockAppDatabase  extends Mock
    implements AppDatabase {
  MockAppDatabase(NativeDatabase nativeDatabase);
}
void main() {
  late MockAppDatabase mockAppDatabase;


  setUp(() async {
    // clean up db before every test
    mockAppDatabase = MockAppDatabase(NativeDatabase.memory());
  });

  tearDownAll(() async {
    // clean up db after all tests
    await mockAppDatabase.close();
  });

  group('DBManager', () {
    test('auditEntity can be added', () async {
     final  List<AuditEntityTableCompanion> list= [AuditEntityTableCompanion(auditEntityId: Value(1),auditEntityName: Value('Gujarat'))];
     final ad = await mockAppDatabase.auditEntityDao.insertAuditEntity(list);
      final listData = await mockAppDatabase.auditEntityDao.watchAllAuditEntity();

      expect(list, listData);
    });

    // test('Update items', () async {});
    // test('Delete items', () async {});
    // test('Retrieve items', () async {});
    // test('Delete database', () async {});

});
}*/
