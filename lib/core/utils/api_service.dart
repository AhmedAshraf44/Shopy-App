import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  String baseUrl = 'https://student.valuxapps.com/api/';
  ApiService(this.dio);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, String>? data,
    String? token,
  }) async {
    var response = await dio.post('$baseUrl$endPoint',
        data: data,
        options: Options(headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'lang': 'en',
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> get({
    required String endPoint,
    //  required Map<String, String>? data,
    required String? token,
  }) async {
    var response = await dio.get('$baseUrl$endPoint',
        options: Options(headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'lang': 'en',
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    //  required Map<String, String>? data,
    required String? token,
  }) async {
    var response = await dio.delete('$baseUrl$endPoint',
        options: Options(headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'lang': 'en',
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    //  required Map<String, String>? data,
    required String? token,
  }) async {
    var response = await dio.put('$baseUrl$endPoint',
        options: Options(headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'lang': 'en',
        }));
    return response.data;
  }
}
