import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:drift_task/core/UseCase.dart';
import 'package:drift_task/core/failure.dart';
import 'package:drift_task/feature/drifit_task/data/data_sources/database/drifit_database.dart';
import 'package:drift_task/feature/drifit_task/domain/repositories/audit_repository.dart';
import 'package:drift_task/feature/drifit_task/domain/use_cases/delete_audit_usecase.dart';
import 'package:drift_task/feature/drifit_task/domain/use_cases/get_audit_usecase.dart';
import 'package:drift_task/feature/drifit_task/domain/use_cases/update_audit_usecase.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/insert_audit_usecase.dart';

part 'drift_data_state.dart';

class DriftDataCubit extends Cubit<DriftDataState> {
  DriftDataCubit(this.insertAuditUsecase, this.getAuditUsecase,this.deleteAuditUsecase,this.updateAuditUsecase)
      : super(DriftDataInitial());
  InsertAuditUsecase insertAuditUsecase;
  GetAuditUsecase getAuditUsecase;
  DeleteAuditUsecase deleteAuditUsecase;
  UpdateAuditUsecase updateAuditUsecase;
  void addData() {
    print('cubit insert');
    insertAuditUsecase.call(NoParams());
  }

  void getData() async {
    print('cubit');
    Either<Failure, List<Audit>> e = await getAuditUsecase.call(NoParams());

    e.fold((l) => {
      print('fail')
    }, (r) {
      print(r);
      emit(DrifitDataSucc(r as List<Audit>));
    });

    // await getAuditUsecase.call(NoParams());
  }

  Future<void> deleteData(Audit a) async {
    print(a);
    print('cubit');
    await deleteAuditUsecase.call(a);
    getData();
    // Either<Failure,void> res= await deleteAuditUsecase.call(a);
    // res.fold((l) => {print('fail')}, (r) => print('succ'));
     // getData();
  }
  Future<void> updateData(Audit a)async{
      print(a);
      await updateAuditUsecase.call(a);
      getData();

  }


}
