
import 'package:equatable/equatable.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';

import '../../domain/entities/employee_entities.dart';

abstract class EmployeeState extends Equatable {
  EmployeeState();
}

class Empty extends EmployeeState {

  @override
  List<Object?> get props => [];
}

class Loading extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class Loaded extends EmployeeState {
  final List<Employee?>? employeeList;

  Loaded({required this.employeeList});

  @override
  List<Object> get props => [employeeList!];
}

class Error extends EmployeeState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}
