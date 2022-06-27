import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/employee_entities_repository.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/get_employee_entities_usecase.dart';

class MockEmployeeRepository extends Mock
    implements EmployeeRepository {}

void main() {
  late GetEmployeeEntities usecase;
  late MockEmployeeRepository mockEmployeeRepository;

  setUp(() {
    mockEmployeeRepository = MockEmployeeRepository();
    usecase = GetEmployeeEntities(mockEmployeeRepository);
  });

  final List<Employee> temployee= [Employee(employeeId: 1,employeeName: 'Nirali'),Employee(employeeId: 2,employeeName: 'OMG')];

  test(
    'should get AuditEntities from the repository',
        () async {
      // arrange
      when(mockEmployeeRepository.getEmployeeEntities())
          .thenAnswer((_) async => Right(temployee));
      // act
      // Since random number doesn't require any parameters, we pass in NoParams.
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(temployee));
      verify(mockEmployeeRepository.getEmployeeEntities());
      verifyNoMoreInteractions(mockEmployeeRepository);
    },
  );
}