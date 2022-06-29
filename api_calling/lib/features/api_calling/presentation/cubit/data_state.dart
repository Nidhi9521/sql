part of 'data_cubit.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class GetDataSucc extends DataState{
  List<QutoesModel> modelQutoes;
  GetDataSucc(this.modelQutoes);
}

class GetDataFail extends DataState{}

class GetDataPartSucc extends DataState{
  QutoesModel modelQutoes;
  GetDataPartSucc(this.modelQutoes);
}

class GetDataPartFail extends DataState{}

class serchActive extends DataState{}

class serchInActive extends DataState{}
