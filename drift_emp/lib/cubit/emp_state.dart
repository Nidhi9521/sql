part of 'emp_cubit.dart';

@immutable
abstract class EmpState {}

class EmpInitial extends EmpState {}

class EmpInsSucc extends EmpState {}
class EmpInsFail extends EmpState {}
class EmpGetSucc extends EmpState {}
class EmpGetFail extends EmpState {}
