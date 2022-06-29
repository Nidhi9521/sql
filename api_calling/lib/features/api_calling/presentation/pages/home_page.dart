import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:api_calling/features/api_calling/presentation/cubit/data_cubit.dart';
import 'package:api_calling/features/api_calling/presentation/widgets/card_view.dart';
import 'package:api_calling/features/api_calling/presentation/widgets/list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {

  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<DataCubit,DataState>(
          builder: (context,state){
            if(state is serchActive){
              return Text('API Calling');
            }
            return
              TextField(
              controller: _name,
              decoration: InputDecoration(
                labelText: 'Enter Author',
                labelStyle:  TextStyle(color: Colors.white),
              ),style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              // keyboardType: TextInputType.number,
            );
          },
        ),
        actions: [
          BlocBuilder<DataCubit, DataState>(
            builder: (context, state) {
              return Row(
                children: [
                  state is serchActive ?
                  IconButton(onPressed: () {
                    print('search');
                    context.read<DataCubit>().serch(1);
                  }, icon: Icon(Icons.search_rounded)) :
                  IconButton(onPressed: () {
                    print('close');
                    context.read<DataCubit>().serch(0);
                    if(_name.text.isNotEmpty) {
                      context.read<DataCubit>().serchData(_name
                          .text);
                      _name.clear();
                    }
                  }, icon: Icon(Icons.arrow_right_outlined)),
                ],
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is GetDataSucc) {
            return ListQuoteView(data: state.modelQutoes);
          }
          if(state is GetDataPartSucc){
            return CardView(qutoesModel: state.modelQutoes);
          }

          return Center(child: CircularProgressIndicator());
        },

      ),


      floatingActionButton:Stack(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left:31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child:FloatingActionButton(
                onPressed: () {
                  print('btn press');
                  context.read<DataCubit>().getData();
                },
                child: Icon(Icons.add),
              ),
            ),),

          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: (){
                context.read<DataCubit>().randomData();
              },
              child: Icon(Icons.access_time_outlined),),
          ),
        ],
      )


    );
  }
}
