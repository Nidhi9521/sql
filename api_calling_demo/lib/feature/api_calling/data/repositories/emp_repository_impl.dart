import 'package:api_calling_demo/core/failure.dart';
import 'package:api_calling_demo/feature/api_calling/data/data_sources/data_source_api.dart';
import 'package:api_calling_demo/feature/api_calling/data/models/employeeModel.dart';
import 'package:api_calling_demo/feature/api_calling/domain/repositories/emp_repository.dart';
import 'package:dartz/dartz.dart';

class EmployeeRepositoryImpl extends EmployeeRepository{
  DataSource dataSource;
  EmployeeRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<EmployeeModel>>> getAllData() async{
   try {
     var res = await dataSource.getAllData();
     return Right(res);
   }catch(e){
     return Left(LocalFailure());
   }
  }

  @override
  Future<Either<Failure, List<EmployeeModel>>> postData(EmployeeModel employeeModel) async {
    try{
      var res = await dataSource.postData(employeeModel);
      return Right(res);
    }catch(e){
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<EmployeeModel>>> deleteData(EmployeeModel employeeModel) async {
    try{
      var res = await dataSource.deleteData(employeeModel);
      return Right(res);
    }catch(e){
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, EmployeeModel>> getPartData(int id) async {
    try{
      var res = await dataSource.getPartData(id);
      return Right(res);
    }catch(e){
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<EmployeeModel>>> updateData(EmployeeModel employeeModel)async {
    try{
      print('update repo impl');
      var res =await dataSource.updateData(employeeModel);
      return Right(res);
    }catch(e){
      return Left(LocalFailure());
    }
  }

}