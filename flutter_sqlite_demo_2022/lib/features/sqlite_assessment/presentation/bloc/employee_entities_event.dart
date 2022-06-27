import 'package:equatable/equatable.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';

import '../../domain/entities/employee_entities.dart';

abstract class EmployeeEvent extends Equatable {
  final Employee? employeesEntities;
  EmployeeEvent({this.employeesEntities});

  @override
  List<Object> get props => [employeesEntities!];
}

class GetAllEmployeeEvent extends EmployeeEvent {
  GetAllEmployeeEvent();
}

class DeleteEmployeeEvent extends EmployeeEvent {
  DeleteEmployeeEvent(Employee employeesEntities) : super(employeesEntities: employeesEntities);
}

class AddEmployeeEvent extends EmployeeEvent {
   AddEmployeeEvent() : super();
}

class UpdateEmployeeEvent extends EmployeeEvent {
  UpdateEmployeeEvent(Employee employeesEntities) : super(employeesEntities: employeesEntities);
}
