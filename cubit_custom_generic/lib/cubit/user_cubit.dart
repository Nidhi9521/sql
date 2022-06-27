import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  // super(StateOnSuccess<GettingStartedData>(GettingStartedData()));
  void valueChange(){
    print('cubit');
    //emit(StateOnSuccess((state as StateOnSuccess<GettingStartedData>).response.copyWith(dailyBudgetValue: 0)));
    emit(userPass((state as userPass<customUse>).response.copyWith(a:1676236,b: 'how are you???',c:false)));
  }
}
class customUse{
  int? a;
  String? b;
  bool? c;
  customUse({this.a,this.b,this.c});
  customUse copyWith({
    int? a,
    String? b,
    bool? c
  }) {
    return customUse(
      a:a ?? this.a,
      b:b ?? this.b,
      c:c ?? this.c
    );
  }

}
