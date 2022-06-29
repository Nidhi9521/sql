import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:drift_emp/local/database/drifit_database.dart';
import 'package:drift_emp/model/emp_model.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'emp_state.dart';

class EmpCubit extends Cubit<EmpState> {
  EmpCubit() : super(EmpInitial());
  AppDatabase appDatabase=AppDatabase();

  Future<void> addEmp() async {
    // try {
      var jsonText = await rootBundle.loadString('assets/emp.json');
      Map<String, dynamic> map = json.decode(jsonText);
      List<dynamic> data = map["emp"];
      // print(data.toString());
      List<employee> subList = data.map((e) => employee.fromJson(e)).toList();
      List<EmployeeTableCompanion> list = [];
      for (var element in subList) {
        final data = EmployeeTableCompanion.insert(
          employeeId: Value(element.id),
          employeeName: Value(element.name),
          employeeSalary: Value(element.salary),
        );
        list.add(data);
      }
      print(list);
       final add = await appDatabase.employeeDao.insertEmployee(list);
      print('succ add');
      emit(EmpInsSucc());
    // } catch (e) {
    //   print('succ fail');
    //   emit(EmpInsFail());
    // }
  }

  Future<List<Employee>> getData() async {
    // try{
      List<Employee> get = await appDatabase.employeeDao.watchAllEmployee();
      emit(EmpGetSucc());
      return get;
    // }on Exception{
    //  emit(EmpInsFail());
    //  return ;
    // }
  }
}
