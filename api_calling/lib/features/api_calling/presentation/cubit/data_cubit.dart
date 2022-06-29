import 'package:api_calling/core/UseCase.dart';
import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:api_calling/features/api_calling/domain/use_cases/get_breaking_bad_author_usecase.dart';
import 'package:api_calling/features/api_calling/domain/use_cases/get_breaking_bad_part_usecase.dart';
import 'package:api_calling/features/api_calling/domain/use_cases/get_breaking_bad_random_usecase.dart';
import 'package:api_calling/features/api_calling/domain/use_cases/get_breaking_bad_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.getBreakingBadUsecase, this.getBreakingBadDataModelUsecase,
      this.getBrekingBadAuthorUsecase,this.getBrakingBadRandomUsecase) : super(DataInitial());
  GetBreakingBadUsecase getBreakingBadUsecase;
  GetBreakingBadDataModelUsecase getBreakingBadDataModelUsecase;
  GetBrekingBadAuthorUsecase getBrekingBadAuthorUsecase;
  GetBrakingBadRandomUsecase getBrakingBadRandomUsecase;


  Future<void> getData() async {
    print('cubit');
    var data = await getBreakingBadUsecase.call(NoParams());
    data.fold((l) => emit(GetDataFail()), (r) => emit(GetDataSucc(r)));
  }

  void serch(a) {
    if (a == 1) {
      emit(serchInActive());
    } else {
      emit(serchActive());
    }
  }

  void serchData(data) async {
    var check=isNumeric(data);
    var res;
    if(check==true){
      print(check);
      print('author');
       res = await getBrekingBadAuthorUsecase.call(data.toString());
      res.fold((l) => emit(GetDataPartFail()), (r) => emit(GetDataSucc(r)));
    }else if(check==false){
      print(check);
      print(data);
      print('data');
       res = await getBreakingBadDataModelUsecase.call(int.parse(data));
       res.fold((l) => emit(GetDataPartFail()), (r) => emit(GetDataPartSucc(r)));
    }
  }

  void randomData()async{
    var res=await getBrakingBadRandomUsecase.call(NoParams());
    res.fold((l) => emit(GetDataPartFail()), (r) => emit(GetDataPartSucc(r)));
  }
  bool isNumeric(String str) {
    int a=int.parse(str);
   if(a.isEven || a.isOdd){
     return false;
   }else if(a.isNaN){
     return true;
   }
   return true;
  }
}

//bool isNumeric(String s) {
//  if (s == null) {
//    return false;
//  }
//  return double.tryParse(s) != null;
// }

