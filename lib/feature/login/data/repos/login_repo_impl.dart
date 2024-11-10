import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy_app/core/errors/failure.dart';
import 'package:shopy_app/core/utils/api_service.dart';
import 'package:shopy_app/core/utils/end_points.dart';
import 'package:shopy_app/feature/login/data/model/login_model.dart';
import 'package:shopy_app/feature/login/data/repos/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);
  @override
  Future<Either<Failure, LoginModel>> loginUser(
      {required String email, required String password}) async {
    try {
      var data = await apiService.post(endPoint: kLogin, data: {
        'email': email,
        'password': password,
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
