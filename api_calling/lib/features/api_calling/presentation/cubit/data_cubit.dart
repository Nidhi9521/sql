import 'package:api_calling/core/UseCase.dart';
import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:api_calling/features/api_calling/domain/use_cases/get_breaking_bad_part_usecase.dart';
import 'package:api_calling/features/api_calling/domain/use_cases/get_breaking_bad_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.getBreakingBadUsecase,this.getBreakingBadDataModelUsecase) : super(DataInitial());
  GetBreakingBadUsecase getBreakingBadUsecase;
  GetBreakingBadDataModelUsecase getBreakingBadDataModelUsecase;

  Future<void> getData()async{
    print('cubit');
    var data=await getBreakingBadUsecase.call(NoParams());
    data.fold((l) => emit(GetDataFail()), (r) => emit(GetDataSucc(r)));
  }

  void serch(a){
    if(a==1){
      emit(serchInActive());
    }else {
      emit(serchActive());
    }
  }

  void serchData(int id)async{
    print(id);
    var res=await getBreakingBadDataModelUsecase.call(id);
    res.fold((l) => emit(GetDataPartFail()), (r) => emit(GetDataPartSucc(r)));

  }
}
