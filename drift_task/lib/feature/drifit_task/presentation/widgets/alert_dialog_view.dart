import 'package:flutter/material.dart';
typedef callUpdateName=Function (String name);
class AlertView extends StatelessWidget {
  TextEditingController _name=TextEditingController();
  callUpdateName call;
  AlertView(this._name,this.call);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pls Enter data'),
      actions: [
        TextField(
          controller: _name,
          decoration: InputDecoration(
              labelText: 'Enter Name', hintText: 'Enter Name'),
        ),
        ElevatedButton(onPressed: (){
          print('update click');
            call(_name.text);
        }, child: Text('Update'))
      ],
    );
  }
}
