import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/presentation/widgets/show_alert_dialog.dart';

import '../bloc/employee_entities_bloc.dart';
import '../bloc/employee_entities_event.dart';

class EmployeeDisplay extends StatefulWidget {
  const EmployeeDisplay({required this.employeeList, Key? key}) : super(key: key);
  final List<Employee?> employeeList;

  @override
  State<EmployeeDisplay> createState() => _EmployeeDisplayState();
}

class _EmployeeDisplayState extends State<EmployeeDisplay> {
  @override
  Widget build(BuildContext context) {
    if (widget.employeeList.isEmpty) {
      _onAddEmployee(context);
    }
    return ListView.builder(
      itemCount: widget.employeeList.length,
      itemBuilder: (_, index) {
        final itemAuditEntity = widget.employeeList[index];
        return _buildListItem(context,itemAuditEntity);
      },
    );
  }

  Widget _buildListItem(BuildContext context,Employee? employee) {
    return Card(
      elevation: 2.0,
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              label: 'Edit',
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              onPressed: (_) => _onEditAuditEntity(context,employee),
            ),
            SlidableAction(
              label: 'Delete',
              backgroundColor: Colors.red,
              icon: Icons.delete,
              onPressed: (_) => _onDeleteAuditEntity(context,employee),
            ),
          ],
        ),
        child: ListTile(
          title: Text(employee!.employeeName.toString(),style: Theme.of(context).textTheme.headline6,overflow: TextOverflow.ellipsis,),
          subtitle: Text(Jiffy(employee.employeeName).format("MMMM do yyyy, h:mm:ss a").toString(),style: Theme.of(context).textTheme.subtitle1,)
        ),
      ),
    );
  }

  Future<void> _onDeleteAuditEntity(BuildContext context, Employee? employee) async {
    final didRequestDelete = await showAlertDialog(context,
        defalutActionText: 'OK',
        content: 'Are you sure that you want to delete?',
        title: 'Delete Audit Entity',
        cancleActiontext: 'Cancel');
    if(didRequestDelete == true)
      {
        BlocProvider.of<EmployeeBloc>(context).add(DeleteEmployeeEvent(employee!));
      }
   }

  Future<void> _onEditAuditEntity(BuildContext context, Employee? employee) async {
    var values = employee!.employeeName.toString();
    final didRequestDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Audit Entity'),
        content: TextField(
          controller: TextEditingController()..text = values,
            onChanged:(value) {
              setState(() {
                values = value;
              });
            },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('UPDATE'),
          ),
        ],
      ),
    );
    if(didRequestDelete == true)
    {
      BlocProvider.of<EmployeeBloc>(context).add(UpdateEmployeeEvent(employee.copyWith(employeeName: values)));
    }
  }
  void _onAddEmployee(BuildContext context) {
    BlocProvider.of<EmployeeBloc>(context)
        .add(AddEmployeeEvent());
  }
}
