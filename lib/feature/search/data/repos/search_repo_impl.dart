import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/errors/failure.dart';
import 'package:shopy_app/core/utils/api_service.dart';
import 'package:shopy_app/feature/search/data/models/search_model.dart';
import 'package:shopy_app/feature/search/data/repos/search_repo.dart';

import '../../../../core/utils/end_points.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService _apiService;
  SearchRepoImpl(this._apiService);
  @override
  Future<Either<Failure, SearchModel>> searchProduct(String text) async {
    try {
      var result = await _apiService.post(
        endPoint: kSearch,
        token: token,
        data: {
          'text': text,
        },
      );
      return right(SearchModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
