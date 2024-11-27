import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/errors/failure.dart';
import 'package:shopy_app/core/utils/api_service.dart';
import 'package:shopy_app/core/utils/end_points.dart';
import 'package:shopy_app/feature/login/data/model/login_model.dart';
import 'package:shopy_app/feature/settings/data/repos/settings_repo.dart';

class SettingsRepoImpl extends SettingsRepo {
  final ApiService _apiService;

  SettingsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, LoginModel>> getSettings() async {
    try {
      var result = await _apiService.get(
        endPoint: kProfile,
        token: token,
      );
      return right(LoginModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
