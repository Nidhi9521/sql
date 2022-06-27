import 'package:cubit_custom_generic/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool a=true;
    String b="hello";
    int c=500;
    return Scaffold(
      body: Center(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            print(state);
            if(state is userPass<customUse>){
              // c=int.parse(state.response.a);
              c=state.response.a ?? c;
              b=state.response.b ?? b;
              a=state.response.c ?? a;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('int data  =  ' + c.toString()),
                SizedBox(height: 8,),
                Text('String data  =  ' + b),
                SizedBox(height: 8,),
                Text('bool data  =  ' + a.toString()),
                SizedBox(height: 8,),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('call');
          context.read<UserCubit>().valueChange();
        },

      ),
    );
  }
}
