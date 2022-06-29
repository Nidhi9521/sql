import 'package:drift_emp/cubit/emp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../local/database/drifit_database.dart';

class MainPage extends StatelessWidget {
  late List<Employee> modelList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EmpCubit, EmpState>(
        builder: (context, state) {
          return FutureBuilder<List<Employee>>(
              future: context.read<EmpCubit>().getData(),
              builder: (context, s) {
                if (s.hasData) {
                  modelList = s.data as List<Employee>;
                  return ListView.builder(
                      itemCount: modelList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          )),
                          title: Text(modelList[index].employeeName.toString()),
                          subtitle:
                              Text(modelList[index].employeeSalary.toString()),
                        ));
                      });
                } else {
                  return const Center(
                    child: Text("No data available"),
                  );
                }
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('call');
          context.read<EmpCubit>().addEmp();
        },
      ),
    );
  }
}
