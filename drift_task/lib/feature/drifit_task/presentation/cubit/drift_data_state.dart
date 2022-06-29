part of 'drift_data_cubit.dart';

@immutable
abstract class DriftDataState {}

class DriftDataInitial extends DriftDataState {}

class DrifitDataSucc extends DriftDataState{
  List<Audit> modelAudit;
  DrifitDataSucc(this.modelAudit);
}

