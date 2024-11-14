import 'package:dartz/dartz.dart';
import 'package:shopy_app/core/errors/failure.dart';

import '../../../home/data/model/categories_model/categories_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, CategoriesModel>> getCategoryDetails(
      {required int id});
}
