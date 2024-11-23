import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/errors/failure.dart';
import 'package:shopy_app/core/utils/api_service.dart';
import 'package:shopy_app/core/utils/end_points.dart';
import 'package:shopy_app/feature/favorites/data/models/favorite_model/favorite_model.dart';
import 'package:shopy_app/feature/favorites/data/repos/favorites_repo.dart';

class FavoritesRepoImpl extends FavoritesRepo {
  final ApiService _apiService;

  FavoritesRepoImpl(this._apiService);
  @override
  Future<Either<Failure, FavoriteModel>> getFavorites() async {
    try {
      var result = await _apiService.get(
        endPoint: kAddFavourite,
        token: token,
      );
      return right(FavoriteModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
