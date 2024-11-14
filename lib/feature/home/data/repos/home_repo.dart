import 'package:dartz/dartz.dart';
import 'package:shopy_app/core/errors/failure.dart';
import 'package:shopy_app/feature/home/data/model/home_model/home_model.dart';

import '../model/gategories_model/gategories_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> getHomeData();
  Future<Either<Failure, GategoriesModel>> getGategories();
}
