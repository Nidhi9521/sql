import 'package:api_calling_demo/feature/api_calling/data/models/employeeModel.dart';
import 'package:api_calling_demo/feature/api_calling/presentation/cubit/data_cubit.dart';
import 'package:api_calling_demo/feature/api_calling/presentation/widgets/alert_dialog_view.dart';
import 'package:api_calling_demo/feature/api_calling/presentation/widgets/card_view.dart';
import 'package:api_calling_demo/feature/api_calling/presentation/widgets/list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _empId = TextEditingController();
    TextEditingController _empfName = TextEditingController();
    TextEditingController _emplName = TextEditingController();
    EmployeeModel employeeModel;
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<DataCubit, DataState>(
          builder: (context, state) {
            if (state is serchActive) {
              return TextField(
                autofocus: true,
                controller: _empId,
                decoration: InputDecoration(
                  labelText: 'Enter EmployeeId',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    print(value);
                    context
                        .read<DataCubit>()
                        .getPartEmpData(int.parse(_empId.text));
                    _empId.clear();
                  }
                },
                keyboardType: TextInputType.number,
              );
            }
            return Text('API Calling');
          },
        ),
        actions: [
          BlocBuilder<DataCubit, DataState>(
            builder: (context, state) {
              print(state);
              return Row(
                children: [
                  state is serchActive
                      ? IconButton(
                          onPressed: () {
                            print('close');
                            context.read<DataCubit>().serch(1);
                            context.read<DataCubit>().getAllEmpData();
                          },
                          icon: Icon(Icons.clear))
                      : IconButton(
                          onPressed: () {
                            print('search');
                            context.read<DataCubit>().serch(0);
                          },
                          icon: Icon(Icons.search_rounded)),
                ],
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is GetDataSucc) {
            return ListEmpView(
                data: state.employeeModel,
                update: (e) {
                  print('update click');
                  context.read<DataCubit>().updateEmpData(e);
                  // context.read<DataCubit>().
                },
                delete: (e) {
                  print(e.firstName);
                  context.read<DataCubit>().deleteEmpData(e);
                });
          }
          if (state is GetDataFail) {
            return Center(
              child: Text('Data is not found!!'),
            );
          }
          if (state is GetPartDataSucc) {
            return CardView(
              employeeModel: state.employeeModel,
            );
          }
          if (state is Loaded) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _empId.clear();
          print('click me');
          showDialog(
              context: context,
              builder: (_) {
                return AlertView(0,_empId,_empfName, _emplName, (empId,fName, lName) {
                  print(fName);
                  print(lName);
                  EmployeeModel employeeModel =
                      EmployeeModel(empId:int.parse(empId),firstName: fName, lastName: lName);
                  context.read<DataCubit>().postEmpData(employeeModel);
                });
              });
          // context.read<DataCubit>().getAllEmpData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
