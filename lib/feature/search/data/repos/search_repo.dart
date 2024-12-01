import 'package:dartz/dartz.dart';
import 'package:shopy_app/core/errors/failure.dart';
import 'package:shopy_app/feature/search/data/models/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchModel>> searchProduct(String text);
}
