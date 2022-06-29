import 'package:api_calling/core/UseCase.dart';
import 'package:api_calling/core/failure.dart';
import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:api_calling/features/api_calling/domain/repositories/braking_bad_repository.dart';
import 'package:dartz/dartz.dart';

class GetBrekingBadAuthorUsecase extends UseCase<void,String>{
  BrakingBadRepository brakingBadRepository;
  GetBrekingBadAuthorUsecase(this.brakingBadRepository);

  @override
  Future<Either<Failure, List<QutoesModel>>> call(String params)async {
    return await brakingBadRepository.getBrakingBadDataModelAuthor(params);
  }

}