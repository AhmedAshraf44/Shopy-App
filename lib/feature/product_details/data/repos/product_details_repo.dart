import 'package:dartz/dartz.dart';
import 'package:shopy_app/core/errors/failure.dart';

import '../models/product_details_model.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(
      {required int id});
}
