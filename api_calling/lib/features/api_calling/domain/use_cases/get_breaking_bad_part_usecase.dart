import 'package:api_calling/core/UseCase.dart';
import 'package:api_calling/core/failure.dart';
import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:api_calling/features/api_calling/domain/repositories/braking_bad_repository.dart';
import 'package:dartz/dartz.dart';

class GetBreakingBadDataModelUsecase extends UseCase<void,int>{
  BrakingBadRepository brakingBadRepository;
  GetBreakingBadDataModelUsecase(this.brakingBadRepository);
  @override
  Future<Either<Failure, QutoesModel>> call(int params) async{
    return await brakingBadRepository.getBrakingBadDataModel(params);
  }

}