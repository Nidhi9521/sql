import 'package:api_calling_demo/feature/api_calling/data/data_sources/data_source_api.dart';
import 'package:api_calling_demo/feature/api_calling/data/repositories/emp_repository_impl.dart';
import 'package:api_calling_demo/feature/api_calling/domain/repositories/emp_repository.dart';
import 'package:api_calling_demo/feature/api_calling/domain/use_cases/delete_emp_data_usecase.dart';
import 'package:api_calling_demo/feature/api_calling/domain/use_cases/get_emp_data_usecase.dart';
import 'package:api_calling_demo/feature/api_calling/domain/use_cases/get_emp_part_data_usecase.dart';
import 'package:api_calling_demo/feature/api_calling/domain/use_cases/post_emp_data_usecase.dart';
import 'package:api_calling_demo/feature/api_calling/domain/use_cases/update_emp_data_usecase.dart';
import 'package:api_calling_demo/feature/api_calling/presentation/cubit/data_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

Future<void> init() async {

  //cubit
  sl.registerFactory(() => DataCubit(sl(),sl(),sl(),sl(),sl()));
  //repo
  sl.registerLazySingleton<EmployeeRepository>(() => EmployeeRepositoryImpl(sl()));
  sl.registerLazySingleton<DataSource>(() => DataSourceImpl(sl()));
  //usecase
  sl.registerLazySingleton(() => GetAllEmpDataUseCase(sl()));
  sl.registerLazySingleton(() => GetEmpPartDataUsecase(sl()));
  sl.registerLazySingleton(() => PostEmpDataUsecase(sl()));
  sl.registerLazySingleton(() => DeleteEmpDataUsecase(sl()));
  sl.registerLazySingleton(() => UpdateEmpDataUsecase(sl()));

  sl.registerLazySingleton(() => Dio());

  //datasource
  // sl.registerLazySingleton(() => AuditDao(sl()));
  // sl.registerLazySingleton(() => AppDatabase());
}