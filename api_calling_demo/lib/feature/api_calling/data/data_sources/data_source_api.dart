import 'dart:io';

import 'package:api_calling_demo/feature/api_calling/data/models/employeeModel.dart';
import 'package:dio/dio.dart';

abstract class DataSource {
  Future<List<EmployeeModel>> getAllData();

  Future<List<EmployeeModel>> deleteData(EmployeeModel employeeModel);

  Future<List<EmployeeModel>> postData(EmployeeModel employeeModel);
  Future<List<EmployeeModel>> updateData(EmployeeModel employeeModel);
  Future<EmployeeModel> getPartData(int id);
}

class DataSourceImpl extends DataSource {
  final Dio _dio;

  DataSourceImpl(this._dio);

  @override
  Future<List<EmployeeModel>> getAllData() async {
    try {
      print('datasource');
      final _baseUrl = 'http://192.168.102.164:3000/emps';
      print('url');
      print(_baseUrl);
      Response response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        http: //192.168.0.100:3000/
        final List<EmployeeModel> emplist = [];
        final jsonlist = response.data;
        for (var item in jsonlist) {
          emplist.add(EmployeeModel.fromJson(item));
          print(item);
        }
        print(emplist);
        return emplist;
      } else {
        print('fail');
        throw SocketException('msg');
      }
    } catch (e) {
      throw SocketException('msg');
    }
  }

  @override
  Future<List<EmployeeModel>> deleteData(EmployeeModel employeeModel) async {
    try {
      final _baseUrl = 'http://192.168.102.164:3000/emps';
      var id = employeeModel.empId;
      print(employeeModel.empId);
      print('delte datasource');
      Response responseData = await _dio.delete(_baseUrl + '/$id/delete');
      Response response = await _dio.get(_baseUrl);
      if (responseData.statusCode == 200 && response.statusCode == 200) {
        http: //192.168.0.100:3000/
        final List<EmployeeModel> emplist = [];
        final jsonlist = response.data;
        for (var item in jsonlist) {
          emplist.add(EmployeeModel.fromJson(item));
          print(item);
        }
        print(emplist);
        return emplist;
        print('User deleted!');
      } else {
        print('fail');
        throw SocketException('msg');
      }

    } catch (e) {
      throw SocketException('Exception');
    }
  }

  @override
  Future<EmployeeModel> getPartData(id) async {
    try{
      print('datasource');
      final _baseUrl = 'http://192.168.102.164:3000/emps/$id';
      print('url');
      print(_baseUrl);
      Response response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        print(response.data);
        EmployeeModel employeeModel = EmployeeModel.fromJson(response.data[0]);
        print(employeeModel);
        return (employeeModel);
      }else{
        print('fail');
        throw SocketException('msg');
      }
    }catch(e){
      throw SocketException('Exception');
    }
  }

  @override
  Future<List<EmployeeModel>> postData(EmployeeModel employeeModel) async {
    try {
      print('datasource');
      final _baseUrl = 'http://192.168.102.164:3000/emps';
      Response response = await _dio.post(
        '$_baseUrl/post',
        data: employeeModel.toJson(),
      );
      print('url');
      print(employeeModel.firstName);
      Response responseData = await _dio.get(_baseUrl);
      if (responseData.statusCode == 200 && response.statusCode == 200) {
        http: //192.168.0.100:3000/
        final List<EmployeeModel> emplist = [];
        final jsonlist = responseData.data;
        for (var item in jsonlist) {
          emplist.add(EmployeeModel.fromJson(item));
          print(item);
        }
        print(emplist);
        return emplist;
      } else {
        print('fail');
        throw SocketException('msg');
      }
    } catch (e) {
      throw SocketException('Exception');
    }
  }

  @override
  Future<List<EmployeeModel>> updateData(EmployeeModel employeeModel) async {
    try {
      print('datasource');
      final _baseUrl = 'http://192.168.102.164:3000/emps';
      var id = employeeModel.empId;

      var dataJson = {
        "FirstName": employeeModel.firstName,
        "LastName": employeeModel.lastName
      };
      Response response = await _dio.put(
        '$_baseUrl/update/$id',
        data: dataJson,
      );
      print('url');
      print(employeeModel.firstName);
      Response responseData = await _dio.get(_baseUrl);
      if (responseData.statusCode == 200 && response.statusCode == 200) {
        http: //192.168.0.100:3000/
        final List<EmployeeModel> emplist = [];
        final jsonlist = responseData.data;
        for (var item in jsonlist) {
          emplist.add(EmployeeModel.fromJson(item));
          print(item);
        }
        print(emplist);
        return emplist;
      } else {
        print('fail');
        throw SocketException('msg');
      }
    } catch (e) {
      throw SocketException('Exception');
    }
  }
}
