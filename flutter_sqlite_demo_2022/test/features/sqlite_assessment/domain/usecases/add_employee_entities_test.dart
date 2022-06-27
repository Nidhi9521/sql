import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/employee_entities_repository.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/add_employee_entities.dart';

class MockEmployeeRepository extends Mock
    implements EmployeeRepository {}

void main() {
  late AddEmployeeEntities usecase;
      late MockEmployeeRepository mockEmployeeRepository;

  setUp(() {
    mockEmployeeRepository = MockEmployeeRepository();
    usecase = AddEmployeeEntities(mockEmployeeRepository);
  });

  test(
    'should add AuditEntity from the repository',
        () async {
      // arrange
      when(mockEmployeeRepository.addEmployeeEntities())
          .thenAnswer((_) async => Right(NoParams()));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(NoParams()));
      verify(mockEmployeeRepository.addEmployeeEntities());
      verifyNoMoreInteractions(mockEmployeeRepository);
    },
  );
}