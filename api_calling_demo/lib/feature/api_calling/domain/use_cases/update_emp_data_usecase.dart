import 'package:api_calling_demo/core/UseCase.dart';
import 'package:api_calling_demo/core/failure.dart';
import 'package:api_calling_demo/feature/api_calling/data/models/employeeModel.dart';
import 'package:api_calling_demo/feature/api_calling/domain/repositories/emp_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateEmpDataUsecase extends UseCase<void,EmployeeModel>{
  EmployeeRepository employeeRepository;
  UpdateEmpDataUsecase(this.employeeRepository);

  @override
  Future<Either<Failure, List<EmployeeModel>>> call(EmployeeModel params)async {
    print('usecase');
    return await employeeRepository.updateData(params);
  }


}