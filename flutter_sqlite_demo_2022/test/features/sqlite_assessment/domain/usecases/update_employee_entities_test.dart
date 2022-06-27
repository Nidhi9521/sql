import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/employee_entities_repository.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/update_employee_entities.dart';

class MockEmployeeRepository extends Mock
    implements EmployeeRepository {}

void main() {
  late UpdateEmployeeEntities usecase;
  late MockEmployeeRepository mockEmployeeRepository;

  setUp(() {
    mockEmployeeRepository = MockEmployeeRepository();
    usecase = UpdateEmployeeEntities(mockEmployeeRepository);
  });

  final  auditEntity= Employee(employeeId: 1,employeeName: 'Nirali');

  test(
    'should update AuditEntity from the repository',
        () async {
      // arrange
      when(mockEmployeeRepository.updateEmployeeEntities(auditEntity))
          .thenAnswer((_) async => Right(auditEntity));
      // act
      final result = await usecase(auditEntity);
      // assert
      expect(result, Right(auditEntity));
      verify(mockEmployeeRepository.updateEmployeeEntities(auditEntity));
      verifyNoMoreInteractions(mockEmployeeRepository);
    },
  );
}