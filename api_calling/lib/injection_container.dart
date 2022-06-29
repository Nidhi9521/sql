import 'package:api_calling/features/api_calling/data/data_sources/data_sourece_api.dart';
import 'package:api_calling/features/api_calling/data/repositories/breaking_bad_repository_impl.dart';
import 'package:api_calling/features/api_calling/domain/repositories/braking_bad_repository.dart';
import 'package:api_calling/features/api_calling/domain/use_cases/get_breaking_bad_part_usecase.dart';
import 'package:api_calling/features/api_calling/domain/use_cases/get_breaking_bad_usecase.dart';
import 'package:api_calling/features/api_calling/presentation/cubit/data_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory(() => DataCubit(sl(),sl()));
  //repo
  sl.registerLazySingleton<BrakingBadRepository>(() => BrakingBadRepositoryImpl(sl()));
  sl.registerLazySingleton<DataSource>(() => DataSourceImpl(sl()));
  //usecase
  sl.registerLazySingleton(() => GetBreakingBadUsecase(sl()));
  sl.registerLazySingleton(() => GetBreakingBadDataModelUsecase(sl()));
  sl.registerLazySingleton(() => Dio());

  //datasource
  // sl.registerLazySingleton(() => AuditDao(sl()));
  // sl.registerLazySingleton(() => AppDatabase());
}