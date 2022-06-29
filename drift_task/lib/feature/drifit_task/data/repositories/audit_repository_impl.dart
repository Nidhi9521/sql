import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift_task/core/failure.dart';
import 'package:drift_task/feature/drifit_task/data/data_sources/database/drifit_database.dart';
import 'package:drift_task/feature/drifit_task/data/models/AuditModel.dart';
import 'package:drift_task/feature/drifit_task/domain/repositories/audit_repository.dart';
import 'package:flutter/services.dart';

class AuditRepositoryImpl extends AuditRepository {
  AppDatabase appDatabase = AppDatabase();

  @override
  Future<Either<Failure, void>> addAudit() async {
    try {
      print('repo iml');
      var jsonText = await rootBundle.loadString('assests/enitity.json');
      Map<String, dynamic> map = json.decode(jsonText);
      print(map);
      List<dynamic> data = map["auditEntity"];
      print(data);
      List<AuditModel> subList =
          data.map((e) => AuditModel.fromJson(e)).toList();
      List<AuditTableCompanion> list = [];
      print(subList);
      for (var element in subList) {
        print(element.auditEntityName);
        final data = AuditTableCompanion.insert(
          AuditEntityId: Value(element.auditEntityId),
          AuditId: Value(element.auditId),
          AuditEntityName: Value(element.auditEntityName),
          AuditEntityTypeId: Value(element.auditEntityTypeId),
          AuditParentEntityId: Value(element.auditEntityTypeId),
          SequenceNo: Value(element.sequenceNo),
          EntityEndDate: Value(element.entityEndDate),
          IsLeafNode: Value(element.isLeafNode),
          BarcodeNFC: Value(element.barcodeNFC),
          EntityLevel: Value(element.entityLevel),
          EntityException: Value(element.entityException),
          ScheduleOccurrenceIds: Value(element.scheduleOccurrenceIds),
        );
        list.add(data);
      }
      print(list);
      await appDatabase.auditDao.insertEmployee(list);
      print('succ add');
      return Right(null);
    } catch (e) {
      print('fail');
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAudit(Audit auditEntities) async {
    try {
      print('delete impl');
      final delete = await appDatabase.auditDao.deleteEmployee(auditEntities);
      return Right(null);
    } catch (e) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Audit>>> getAudit() async {
    try {
      print('impl');
      List<Audit> get = await appDatabase.auditDao.watchAllEmployee();
      print(get);
      return Right(get);
    } catch (e) {
      print('fail');
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateAudit(Audit auditEntities) async {
    try{
      await appDatabase.auditDao.updateEmployee(auditEntities);
      return Right(null);
    }catch(e){
      return Left(LocalFailure());
    }
  }
}
