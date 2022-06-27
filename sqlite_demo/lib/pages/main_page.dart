import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_demo/cubit/db_cubit.dart';
import 'package:sqlite_demo/model/sql_helper.dart';
import 'package:sqlite_demo/model/student_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SQLHelper sqlHelper = SQLHelper();
    TextEditingController _name = TextEditingController();
    TextEditingController _grade = TextEditingController();
    AlertDialog alert = AlertDialog(
      title: Text("Insert Data"),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: Column(
            children: [
              TextField(
                controller: _name,
                decoration: InputDecoration(
                    labelText: 'Enter Name', hintText: 'Enter Your Name'),
              ),
              TextField(
                controller: _grade,
                decoration: InputDecoration(
                    labelText: 'Enter Grade', hintText: 'Enter Your Grade'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Student s = Student(name: _name.text, grade: _grade.text);
                        // sqlHelper.insertData(s);
                        context.read<DbCubit>().insertData(s);
                        Navigator.pop(context);
                        _name.clear();
                        _grade.clear();
                      },
                      child: Text('Insert')),
                ],
              )
            ],
          ),
        ),
      ],
    );
    List<Student> modelList;
    return Scaffold(
        appBar: AppBar(
          title: Text('SQLite Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                });
          },
          child: Icon(Icons.add),
        ),
        body: BlocBuilder<DbCubit, DbState>(
          builder: (context, state) {
            print(state);
            if (state is DBInsertSuccess || state is DbInitial) {
              return FutureBuilder(
                  future: sqlHelper.getModelList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // print(modelList.toString());
                      modelList = snapshot.data as List<Student>;
                      print(modelList[0].name);
                      return ListView.builder(
                          itemCount: modelList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(modelList[index].name),
                                subtitle: Text(modelList[index].grade),
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            _name.text = modelList[index].name;
                                            _grade.text =
                                                modelList[index].grade;
                                            showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          TextField(
                                                            controller: _name,
                                                            decoration: const InputDecoration(
                                                                labelText:
                                                                    'Enter Name',
                                                                hintText:
                                                                    'Enter Your Name'),
                                                          ),
                                                          TextField(
                                                            controller: _grade,
                                                            decoration: const InputDecoration(
                                                                labelText:
                                                                    'Enter Grade',
                                                                hintText:
                                                                    'Enter Your grade'),
                                                          ),
                                                          BlocProvider(
                                                            create: (context) =>
                                                                DbCubit(),
                                                            child: BlocBuilder<
                                                                DbCubit,
                                                                DbState>(
                                                              builder: (context,
                                                                  state) {
                                                                return ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Student s = Student(name: _name.text, grade: _grade.text);
                                                                      // sqlHelper.update(
                                                                      //     s, modelList[index].id);
                                                                      context.read<DbCubit>().update(s, modelList[index].id);
                                                                      Navigator.pop(context);
                                                                      _name.clear();
                                                                      _grade.clear();
                                                                    },
                                                                    child: Text('click'));
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          icon: Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {
                                            context
                                                .read<DbCubit>()
                                                .delete(modelList[index].id);
                                            // sqlHelper.delete(modelList[index].id);
                                          },
                                          icon: Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return CircularProgressIndicator();
                  });
            } else if(state is DBInsertFail){
              print('Fail');
              var snackBar = SnackBar(content: Text('Fai'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              return SizedBox();

            }else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
