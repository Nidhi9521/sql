import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/employee_entities_repository.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/delete_employee_entities.dart';

class MockEmployeeRepository extends Mock
    implements EmployeeRepository {}

void main() {
  late DeleteEmployeeEntities usecase;
  late MockEmployeeRepository mockEmployeeRepository;

  setUp(() {
    mockEmployeeRepository = MockEmployeeRepository();
    usecase = DeleteEmployeeEntities(mockEmployeeRepository);
  });

  final employee = Employee(employeeId: 1,employeeName: 'Gujarat');

  test(
    'should delete AuditEntity from the repository',
        () async {
      // arrange
      when(mockEmployeeRepository.deleteEmployeeEntities(employee))
          .thenAnswer((_) async => Right(employee));
      // act
      final result = await usecase(employee);
      // assert
      expect(result, Right(employee));
      verify(mockEmployeeRepository.deleteEmployeeEntities(employee));
      verifyNoMoreInteractions(mockEmployeeRepository);
    },
  );
}