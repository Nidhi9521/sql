import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/models/employee_model.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/entities/employee_entities.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tEmployeesModel = EmployeesModel(
      employeeId: 3273,
      employeeName: "Nirali",
      employeeSalary: 932,
      employeeJoiningDate: "2021-10-07T06:25:02",
  );
  test(
    'should be a subclass of EmployeesEntities',
        () async {
      // assert
      expect(tEmployeesModel, isA<EmployeesEntities>());
    },
  );
  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixture('entity.json'));
        // act
        final result = EmployeesModel.fromJson(jsonMap);
        // assert
        expect(result, tEmployeesModel);
      },
    );

  });
}