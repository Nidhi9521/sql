import 'package:flutter/material.dart';
typedef callUpdateName=Function (String id,String fname,String lname);
class AlertView extends StatelessWidget {
  TextEditingController _fname=TextEditingController();
  TextEditingController _id=TextEditingController();
  TextEditingController _lname=TextEditingController();
  callUpdateName call;
  var flag;
   AlertView(this.flag,this._id,this._fname,this._lname,this.call);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: flag==1 ? Text('Update Emp Data') : Text('Insert Emp Data'),
      actions: [
        TextField(
          enabled: flag==1 ? false : true,
          controller: _id,
          decoration: InputDecoration(
              labelText: 'Enter EmployeeId', hintText: 'Enter EmployeeId'),
        ),
        TextField(
          controller: _fname,
          decoration: InputDecoration(
              labelText: 'Enter FirstName', hintText: 'Enter FirstName'),
        ),
        TextField(
          controller: _lname,
          decoration: InputDecoration(
              labelText: 'Enter LastName', hintText: 'Enter LastName'),
        ),
        ElevatedButton(onPressed: (){
          print('update click');
          if(_fname.text.isNotEmpty && _lname.text.isNotEmpty && _id.text.isNotEmpty){
            call(_id.text.toString(),_fname.text.toString(),_lname.text.toString());
          }else{
            print('empty');
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Empty Data!! Pls Enter Data..'),
                )
            );
          }
          _id.clear();
          _fname.clear();
          _lname.clear();
          Navigator.of(context).pop();
        }, child: flag==1 ? Text('Update') : Text('Insert'))
      ],
    );
  }
}