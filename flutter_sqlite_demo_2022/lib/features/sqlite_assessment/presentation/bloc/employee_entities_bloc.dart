import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';
import '../../data/datasources/local/database/drift_database.dart';
import '../../domain/entities/employee_entities.dart';
import '../../domain/usecases/add_employee_entities.dart';
import '../../domain/usecases/delete_employee_entities.dart';
import '../../domain/usecases/get_employee_entities_usecase.dart';
import '../../domain/usecases/update_employee_entities.dart';
import 'employee_entities_event.dart';
import 'employee_entities_state.dart';

const String Local_FAILURE_MESSAGE = 'Local Failure';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetEmployeeEntities getEmployeeEntities;
  final AddEmployeeEntities addEmployeeEntities;
  final DeleteEmployeeEntities deleteEmployeeEntities;
  final UpdateEmployeeEntities updateEmployeeEntities;

  EmployeeBloc(this.getEmployeeEntities, this.updateEmployeeEntities,
      this.deleteEmployeeEntities, this.addEmployeeEntities)
      : super(Empty());

  @override
  Stream<EmployeeState> mapEventToState(
      EmployeeEvent event,
  ) async* {
    if (event is GetAllEmployeeEvent) {
      yield* _getAllSavedArticles();
    }
    if (event is DeleteEmployeeEvent) {
      await deleteEmployeeEntities(event.employeesEntities!);
      yield* _getAllSavedArticles();
    }
    if (event is AddEmployeeEvent) {
      await addEmployeeEntities(NoParams());
      yield* _getAllSavedArticles();
    }
    if (event is UpdateEmployeeEvent) {
      await updateEmployeeEntities(event.employeesEntities!);
      yield* _getAllSavedArticles();
    }
  }
  Stream<EmployeeState> _getAllSavedArticles() async* {
    yield Loading();
    final getAuditEntitiesList = await getEmployeeEntities(NoParams());
    yield* _eitherLoadedOrErrorState(getAuditEntitiesList);
  }

  Stream<EmployeeState> _eitherLoadedOrErrorState(
      Either<Failure, List<Employee?>?>? either,
      ) async* {
    if(either != null)
    {
      yield either.fold(
            (failure) => Error(message: _mapFailureToMessage(failure)),
            (list) => Loaded(employeeList: list),
      );
    }
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        return Local_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
