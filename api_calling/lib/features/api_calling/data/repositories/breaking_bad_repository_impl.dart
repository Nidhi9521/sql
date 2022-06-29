import 'package:api_calling/core/failure.dart';
import 'package:api_calling/features/api_calling/data/data_sources/data_sourece_api.dart';
import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:api_calling/features/api_calling/domain/repositories/braking_bad_repository.dart';
import 'package:dartz/dartz.dart';

class BrakingBadRepositoryImpl extends BrakingBadRepository{
  DataSource dataSource;
  BrakingBadRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<QutoesModel>>> getBrakingBadData() async{
    print('impl');
    var res=await dataSource.getDataSourceData();
    print(res);
    return Right(res);
  }

  @override
  Future<Either<Failure, QutoesModel>> getBrakingBadDataModel(int id) async {
    print('impl');
    var res=await dataSource.getDataSourceDataModel(id);
    print(res);
    return Right(res);
  }

  @override
  Future<Either<Failure, List<QutoesModel>>> getBrakingBadDataModelAuthor(String author)async {
   print('impl');
   var res=await dataSource.getDataSourceDataModelAuthor(author);
   return Right(res);
  }

  @override
  Future<Either<Failure, QutoesModel>> getBrakingBadDataModelRandom() async{
    print('impl');
    var res=await dataSource.getDataSourceDataRandom();
    return Right(res);
  }

  @override
  Future<Either<Failure, List<QutoesModel>>> getBrakingBadDataModelSeries(String series) {
    // TODO: implement getBrakingBadDataModelSeries
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, QutoesModel>> getBrakingBadDataModelRandomAuthor(String author) {
    // TODO: implement getBrakingBadDataModelRandomAuthor
    throw UnimplementedError();
  }

}