import 'package:api_calling_demo/core/UseCase.dart';
import 'package:api_calling_demo/core/failure.dart';
import 'package:api_calling_demo/feature/api_calling/data/models/employeeModel.dart';
import 'package:api_calling_demo/feature/api_calling/domain/repositories/emp_repository.dart';
import 'package:dartz/dartz.dart';

class GetEmpPartDataUsecase extends UseCase<void, int> {
  EmployeeRepository employeeRepository;

  GetEmpPartDataUsecase(this.employeeRepository);

  @override
  Future<Either<Failure, EmployeeModel>> call(int params) async {
    return await employeeRepository.getPartData(params);
  }
}
