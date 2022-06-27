import 'package:get_it/get_it.dart';
import 'features/sqlite_assessment/data/datasources/local/daos/employee_dao.dart';
import 'features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'features/sqlite_assessment/data/repositories/employee_repository_impl.dart';
import 'features/sqlite_assessment/domain/repositories/employee_entities_repository.dart';
import 'features/sqlite_assessment/domain/usecases/add_employee_entities.dart';
import 'features/sqlite_assessment/domain/usecases/delete_employee_entities.dart';
import 'features/sqlite_assessment/domain/usecases/get_employee_entities_usecase.dart';
import 'features/sqlite_assessment/domain/usecases/update_employee_entities.dart';
import 'features/sqlite_assessment/presentation/bloc/employee_entities_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => EmployeeBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetEmployeeEntities(sl()));
  sl.registerLazySingleton(() => AddEmployeeEntities(sl()));
  sl.registerLazySingleton(() => DeleteEmployeeEntities(sl()));
  sl.registerLazySingleton(() => UpdateEmployeeEntities(sl()));

// Repository
    sl.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(appDatabase: sl()),
  );
  sl.registerSingleton(AppDatabase(openConnection()));
  // Dio client
  sl.registerSingleton<EmployeeDao>(EmployeeDao(sl()));


}
