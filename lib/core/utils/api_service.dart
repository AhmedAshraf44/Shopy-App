import 'package:dio/dio.dart';
import 'package:shopy_app/core/utils/end_points.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    var response = await _dio.post('$kBaseUrl$endPoint',
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
    String? token,
  }) async {
    var response = await _dio.get('$kBaseUrl$endPoint',
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
    var response = await _dio.delete('$kBaseUrl$endPoint',
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
    var response = await _dio.put(
      '$kBaseUrl$endPoint',
      options: Options(
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'lang': 'en',
        },
      ),
    );
    return response.data;
  }
}
