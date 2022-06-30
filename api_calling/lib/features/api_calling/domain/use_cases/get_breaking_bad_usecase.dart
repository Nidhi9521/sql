import 'package:api_calling/core/UseCase.dart';
import 'package:api_calling/core/failure.dart';
import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:api_calling/features/api_calling/domain/repositories/braking_bad_repository.dart';
import 'package:dartz/dartz.dart';

class GetBreakingBadUsecase extends UseCase<void,NoParams>{
  BrakingBadRepository brakingBadRepository;
  GetBreakingBadUsecase(this.brakingBadRepository);
  @override
  Future<Either<Failure, List<QutoesModel>>> call(NoParams params)async {
    print('usecase');
    return await brakingBadRepository.getBrakingBadData();
  }

}