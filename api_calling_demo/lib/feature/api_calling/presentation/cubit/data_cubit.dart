import 'package:api_calling_demo/core/UseCase.dart';
import 'package:api_calling_demo/feature/api_calling/data/models/employeeModel.dart';
import 'package:api_calling_demo/feature/api_calling/domain/use_cases/delete_emp_data_usecase.dart';
import 'package:api_calling_demo/feature/api_calling/domain/use_cases/get_emp_data_usecase.dart';
import 'package:api_calling_demo/feature/api_calling/domain/use_cases/get_emp_part_data_usecase.dart';
import 'package:api_calling_demo/feature/api_calling/domain/use_cases/post_emp_data_usecase.dart';
import 'package:api_calling_demo/feature/api_calling/domain/use_cases/update_emp_data_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.getAllEmpDataUseCase, this.getEmpPartDataUsecase,
      this.postEmpDataUsecase, this.deleteEmpDataUsecase,this.updateEmpDataUsecase)
      : super(DataInitial());

  GetAllEmpDataUseCase getAllEmpDataUseCase;
  GetEmpPartDataUsecase getEmpPartDataUsecase;
  PostEmpDataUsecase postEmpDataUsecase;
  DeleteEmpDataUsecase deleteEmpDataUsecase;
  UpdateEmpDataUsecase updateEmpDataUsecase;

  void getAllEmpData() async {
    print('cubit getAll');
    emit(Loaded());
    var res = await getAllEmpDataUseCase.call(NoParams());
    res.fold((l) => emit(GetDataFail()), (r) => emit(GetDataSucc(r)));
  }

  void getPartEmpData(int id) async {
    print('cubit');
    print(id);
    emit(Loaded());
    var res = await getEmpPartDataUsecase.call(id);
    res.fold((l) => emit(GetDataFail()), (r) => emit(GetPartDataSucc(r)));
  }

  void postEmpData(EmployeeModel employeeModel) async {
    print('post cubit');
    emit(Loaded());
    var res = await postEmpDataUsecase.call(employeeModel);
    res.fold((l) => emit(GetDataFail()), (r) => emit(GetDataSucc(r)));
  }

  void deleteEmpData(EmployeeModel employeeModel) async {
    print('delete cubit');
    emit(Loaded());
    var res = await deleteEmpDataUsecase.call(employeeModel);
    res.fold((l) => emit(GetDataFail()), (r) => emit(GetDataSucc(r)));
  }

  void serch(a) {
    if (a == 1) {
      emit(serchInActive());
    } else {
      emit(serchActive());
    }
  }

  void updateEmpData(EmployeeModel employeeModel)async{
    print('delete cubit');
    emit(Loaded());
    var res = await updateEmpDataUsecase.call(employeeModel);
    res.fold((l) => emit(GetDataFail()), (r) => emit(GetDataSucc(r)));
  }
}
