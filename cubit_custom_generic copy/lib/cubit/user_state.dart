part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {

}

class userPass<T> extends UserState{
  T response;
  userPass(this.response);
}
