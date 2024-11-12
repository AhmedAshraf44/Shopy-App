import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/errors/failure.dart';
import 'package:shopy_app/core/utils/api_service.dart';
import 'package:shopy_app/core/utils/end_points.dart';
import 'package:shopy_app/feature/home/data/model/home_model.dart';
import 'package:shopy_app/feature/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    try {
      var result = await apiService.get(endPoint: kHomeData, token: token);
      return right(HomeModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
