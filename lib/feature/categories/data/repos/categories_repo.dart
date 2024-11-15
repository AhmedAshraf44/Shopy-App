import 'package:dartz/dartz.dart';
import 'package:shopy_app/core/errors/failure.dart';

import '../models/categories_details_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, CategoriesDetailsModel>> getCategoryDetails(
      {required int id});
}
