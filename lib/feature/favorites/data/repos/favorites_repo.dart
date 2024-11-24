import 'package:dartz/dartz.dart';
import 'package:shopy_app/core/errors/failure.dart';
import 'package:shopy_app/feature/favorites/data/models/favorite_model/favorite_model.dart';

import '../models/change_favorite_model.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, FavoriteModel>> getFavorites();
  Future<Either<Failure, ChangeFavoriteModel>> changeFavorites(
      {required int id});
}
