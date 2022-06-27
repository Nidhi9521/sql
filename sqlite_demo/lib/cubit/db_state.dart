part of 'db_cubit.dart';

abstract class DbState extends Equatable {
  const DbState();
}

class DbInitial extends DbState {
  @override
  List<Object> get props => [];
}
class DBInsertSuccess extends DbState{
  @override
  List<Object?> get props => throw UnimplementedError();
}
class DBInsertFail extends DbState{
  @override
  List<Object?> get props => throw UnimplementedError();
}
class DBUpdateSuccess extends DbState{
  @override
  List<Object?> get props => throw UnimplementedError();
}
class DBUpdateFail extends DbState{
  @override
  List<Object?> get props => throw UnimplementedError();
}
class DBDeleteSuccess extends DbState{
  @override
  List<Object?> get props => throw UnimplementedError();
}
class DBDeleteFail extends DbState{
  @override
  List<Object?> get props => throw UnimplementedError();
}
