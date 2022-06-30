import 'package:api_calling/core/failure.dart';
import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:dartz/dartz.dart';

abstract class BrakingBadRepository{
    Future<Either<Failure,List<QutoesModel>>> getBrakingBadData();
    Future<Either<Failure,QutoesModel>> getBrakingBadDataModel(int id);
}