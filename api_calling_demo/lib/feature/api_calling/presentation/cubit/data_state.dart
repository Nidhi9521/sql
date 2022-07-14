part of 'data_cubit.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class GetDataSucc extends DataState {
  List<EmployeeModel> employeeModel;

  GetDataSucc(this.employeeModel);
}

class GetDataFail extends DataState {}

class GetPartDataSucc extends DataState {
  EmployeeModel employeeModel;

  GetPartDataSucc(this.employeeModel);
}

class Loaded extends DataState{}

class serchActive extends DataState{}

class serchInActive extends DataState{}

