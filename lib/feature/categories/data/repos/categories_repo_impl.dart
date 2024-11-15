import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy_app/core/errors/failure.dart';
import 'package:shopy_app/core/utils/api_service.dart';
import 'package:shopy_app/core/utils/end_points.dart';
import 'package:shopy_app/feature/categories/data/repos/categories_repo.dart';
import '../models/categories_details_model.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final ApiService apiService;
  CategoriesRepoImpl(this.apiService);
  @override
  Future<Either<Failure, CategoriesDetailsModel>> getCategoryDetails(
      {required int id}) async {
    try {
      var result = await apiService.get(
        endPoint: '$kGetCategories/$id',
      );
      return right(CategoriesDetailsModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
