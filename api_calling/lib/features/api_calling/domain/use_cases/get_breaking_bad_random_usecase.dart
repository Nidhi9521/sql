import 'package:api_calling/core/UseCase.dart';
import 'package:api_calling/core/failure.dart';
import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:api_calling/features/api_calling/domain/repositories/braking_bad_repository.dart';
import 'package:dartz/dartz.dart';

class GetBrakingBadRandomUsecase extends UseCase<void,NoParams>{
  BrakingBadRepository brakingBadRepository;
  GetBrakingBadRandomUsecase(this.brakingBadRepository);
  @override
  Future<Either<Failure, QutoesModel>> call(NoParams params) async{
    return await brakingBadRepository.getBrakingBadDataModelRandom();
  }

}