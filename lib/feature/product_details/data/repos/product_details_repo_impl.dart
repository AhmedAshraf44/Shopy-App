import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy_app/constants.dart';

import 'package:shopy_app/core/errors/failure.dart';

import 'package:shopy_app/feature/product_details/data/models/product_details_model.dart';

import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/end_points.dart';
import 'product_details_repo.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  final ApiService _apiService;
  ProductDetailsRepoImpl(this._apiService);
  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(
      {required int id}) async {
    try {
      var result = await _apiService.get(
        endPoint: '$kGetProducts/$id',
        token: token,
      );
      return right(ProductDetailsModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
