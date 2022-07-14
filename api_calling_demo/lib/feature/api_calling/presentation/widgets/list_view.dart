import 'package:api_calling_demo/feature/api_calling/data/models/employeeModel.dart';
import 'package:api_calling_demo/feature/api_calling/presentation/cubit/data_cubit.dart';
import 'package:api_calling_demo/feature/api_calling/presentation/widgets/alert_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
typedef Callback =void Function(EmployeeModel);
class ListEmpView extends StatelessWidget {
  List<EmployeeModel> data;
  Callback delete;
  Callback update;
  ListEmpView({required this.data,required this.delete,required this.update}) : super();

  @override
  Widget build(BuildContext context) {
    TextEditingController _fName = TextEditingController();
    TextEditingController _id = TextEditingController();
    TextEditingController _lName = TextEditingController();
    return Center(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, index) {
            return Card(
                color: Colors.transparent,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                  ),
                  title: Text('Name: ${data[index].firstName.toString()} ${data[index].lastName.toString()}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  subtitle: Text('Employee Id: ${data[index].empId.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              print('edit');
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    _id.text=data[index].empId.toString();
                                    _fName.text = data[index].firstName.toString();
                                    _lName.text = data[index].lastName.toString();
                                    return AlertView(1,_id,_fName, _lName,
                                        (id,fName, lName) {
                                      EmployeeModel employeeModel =
                                          EmployeeModel(
                                        id: data[index].id,
                                        firstName:fName,
                                        lastName: lName,
                                        assignments: data[index].assignments,
                                        empId: int.parse(id),
                                        v: data[index].v,
                                      );
                                      context.read<DataCubit>().updateEmpData(employeeModel);
                                      // update(employeeModel);
                                    });
                                  });
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              print('delete');
                              delete(data[index]);
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
