
import 'package:api_calling_demo/core/failure.dart';
import 'package:dartz/dartz.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
}