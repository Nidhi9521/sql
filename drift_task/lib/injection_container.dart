import 'package:drift_task/feature/drifit_task/data/data_sources/dao/audit_dao.dart';
import 'package:drift_task/feature/drifit_task/data/data_sources/database/drifit_database.dart';
import 'package:drift_task/feature/drifit_task/data/repositories/audit_repository_impl.dart';
import 'package:drift_task/feature/drifit_task/domain/repositories/audit_repository.dart';
import 'package:drift_task/feature/drifit_task/domain/use_cases/delete_audit_usecase.dart';
import 'package:drift_task/feature/drifit_task/domain/use_cases/get_audit_usecase.dart';
import 'package:drift_task/feature/drifit_task/domain/use_cases/insert_audit_usecase.dart';
import 'package:drift_task/feature/drifit_task/domain/use_cases/update_audit_usecase.dart';
import 'package:drift_task/feature/drifit_task/presentation/cubit/drift_data_cubit.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory(() => DriftDataCubit(sl(),sl(),sl(),sl()));
  //repo
  sl.registerLazySingleton<AuditRepository>(() => AuditRepositoryImpl());
  //usecase
  sl.registerLazySingleton(() => InsertAuditUsecase(sl()));
  sl.registerLazySingleton(() => GetAuditUsecase(sl()));
  sl.registerLazySingleton(() => DeleteAuditUsecase(sl()));
  sl.registerLazySingleton(() => UpdateAuditUsecase(sl()));

  //datasource
  sl.registerLazySingleton(() => AuditDao(sl()));
  sl.registerLazySingleton(() => AppDatabase());
}