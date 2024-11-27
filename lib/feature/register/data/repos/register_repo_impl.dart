import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy_app/core/errors/failure.dart';
import 'package:shopy_app/core/utils/api_service.dart';
import 'package:shopy_app/core/utils/end_points.dart';
import 'package:shopy_app/feature/login/data/model/login_model.dart';
import 'package:shopy_app/feature/register/data/repos/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  final ApiService _apiService;

  RegisterRepoImpl(this._apiService);
  @override
  Future<Either<Failure, LoginModel>> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      var data = await _apiService.post(endPoint: kRegister, data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      });
      return right(LoginModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
