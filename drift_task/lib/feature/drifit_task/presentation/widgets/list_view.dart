import 'package:drift_task/feature/drifit_task/data/data_sources/database/drifit_database.dart';
import 'package:drift_task/feature/drifit_task/presentation/widgets/alert_dialog_view.dart';
import 'package:flutter/material.dart';
typedef Callback =void Function(Audit);

class ListAuditView extends StatelessWidget {
  List<Audit> data;
  Callback delete;
  Callback update;
  TextEditingController name;
  ListAuditView({required this.data,required this.delete,required this.name,required this.update}) : super();

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_,index){
            return Card(
              color: Colors.white10,
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(45)
                  ),
                ),
                title: Text(data[index].AuditEntityName.toString()),
                subtitle: Text(data[index].EntityEndDate.toString()),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        print('edit');
                        showDialog(context: context, builder: (BuildContext context){
                          name.text=data[index].AuditEntityName.toString();
                          return AlertView(name, (a) {
                            Audit objAudit=Audit(
                              AuditParentEntityId: data[index].AuditParentEntityId,
                              AuditEntityName: a,
                              AuditEntityTypeId: data[index].AuditEntityTypeId,
                              AuditEntityId: data[index].AuditEntityId,
                              AuditId: data[index].AuditId,
                              ScheduleOccurrenceIds: data[index].ScheduleOccurrenceIds,
                              SequenceNo: data[index].SequenceNo,
                              EntityException: data[index].EntityException,
                              EntityLevel: data[index].EntityLevel,
                              EntityEndDate: data[index].EntityEndDate,
                              BarcodeNFC: data[index].BarcodeNFC,
                              IsLeafNode: data[index].IsLeafNode
                            );
                           // data[index].AuditEntityName=a;
                            update(objAudit); });
                        });
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){
                        print('list delete');
                        delete(data[index]);
                      }, icon: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

