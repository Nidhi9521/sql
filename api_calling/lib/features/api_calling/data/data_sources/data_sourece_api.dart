import 'dart:io';

import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:dio/dio.dart';

abstract class DataSource {
  Future<List<QutoesModel>> getDataSourceData();
<<<<<<< HEAD
  Future<QutoesModel> getDataSourceDataModel(int id);
}

class DataSourceImpl extends DataSource{
  final Dio _dio;
=======
  Future<QutoesModel> getDataSourceDataRandom();
  Future<QutoesModel> getDataSourceDataModel(int id);

  Future<List<QutoesModel>> getDataSourceDataModelAuthor(String author);
}

class DataSourceImpl extends DataSource {
  final Dio _dio;

>>>>>>> 1460823af274e00eb0664fe69483f12adc0d9740
  DataSourceImpl(this._dio);

  @override
  Future<List<QutoesModel>> getDataSourceData() async {
    print('datasource');
    final _baseUrl = 'https://breakingbadapi.com/api/quotes';
    Response response = await _dio.get(_baseUrl);
    if (response.statusCode == 200) {
<<<<<<< HEAD
      final List<QutoesModel>quateslist = [];
=======
      final List<QutoesModel> quateslist = [];
>>>>>>> 1460823af274e00eb0664fe69483f12adc0d9740
      final jsonlist = response.data;
      for (var item in jsonlist) {
        quateslist.add(QutoesModel.fromJson(item));
        print(item);
      }
      print(quateslist);
      return (quateslist);
    } else {
      throw SocketException('msg');
    }
  }

  @override
  Future<QutoesModel> getDataSourceDataModel(int id) async {
    print('datasource');
    final _baseUrl = 'https://breakingbadapi.com/api/quotes/$id';
    print(_baseUrl);
    Response response = await _dio.get(_baseUrl);
    if (response.statusCode == 200) {
      print(response.data);
<<<<<<< HEAD
      QutoesModel qutoesModel=QutoesModel.fromJson(response.data[0]);

=======
      QutoesModel qutoesModel = QutoesModel.fromJson(response.data[0]);
>>>>>>> 1460823af274e00eb0664fe69483f12adc0d9740
      print(qutoesModel);
      return (qutoesModel);
    } else {
      print('fail');
      throw SocketException('msg');
    }
  }
<<<<<<< HEAD
}
=======

  Future<List<QutoesModel>> getDataSourceDataModelAuthor(String author) async {
    print('datasource');
    final _baseUrl = 'https://breakingbadapi.com/api/quotes?series=$author';
    print(_baseUrl);
    Response response = await _dio.get(_baseUrl);
    if (response.statusCode == 200) {
      final List<QutoesModel> quateslist = [];
      final jsonlist = response.data;
      for (var item in jsonlist) {
        quateslist.add(QutoesModel.fromJson(item));
        print(item);
      }
      print(quateslist);
      return (quateslist);
    } else {
      print('fail');
      throw SocketException('msg');
    }
  }

  @override
  Future<QutoesModel> getDataSourceDataRandom() async {
    print('datasource');
    final _baseUrl = 'https://breakingbadapi.com/api/quote/random';
    print(_baseUrl);
    Response response = await _dio.get(_baseUrl);
    if (response.statusCode == 200) {
      print(response.data);
      QutoesModel qutoesModel = QutoesModel.fromJson(response.data[0]);
      print(qutoesModel.author);
      return (qutoesModel);
    } else {
      print('fail');
      throw SocketException('msg');
    }
  }
}
>>>>>>> 1460823af274e00eb0664fe69483f12adc0d9740
