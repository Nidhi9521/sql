import 'package:drift_task/feature/drifit_task/presentation/cubit/drift_data_cubit.dart';
import 'package:drift_task/feature/drifit_task/presentation/widgets/list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            print('appbar');
            context.read<DriftDataCubit>().getData();
          }, icon: Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<DriftDataCubit, DriftDataState>(
        builder: (context, state) {
          print(state);
          if(state is DrifitDataSucc){
            return ListAuditView(data: state.modelAudit, delete: (a){
              print('delete call');
              context.read<DriftDataCubit>().deleteData(a);
            }, name: _name,update: (a){
              print(a);
                context.read<DriftDataCubit>().updateData(a);
            });
          }
          return Center(child:CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showDialog(context: context, builder: (BuildContext context){
          // return AlertView(_name,(){print('hello');});
          // });
          print('call');
          context.read<DriftDataCubit>().addData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
