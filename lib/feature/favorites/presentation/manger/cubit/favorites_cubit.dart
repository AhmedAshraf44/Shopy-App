import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/favorites/data/models/change_favorite_model.dart';
import 'package:shopy_app/feature/favorites/data/repos/favorites_repo.dart';

import '../../../../../core/utils/models/favorites_manager.dart';
import '../../../data/models/favorite_model/favorite_model.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._favoritesRepo) : super(FavoritesInitialState());

  static FavoritesCubit get(context) => BlocProvider.of(context);
  FavoriteModel? favoriteModel;
  ChangeFavoriteModel? changeFavoriteModel;
  final FavoritesRepo _favoritesRepo;

  getFavorites() async {
    emit(FavoritesLoadingState());
    var result = await _favoritesRepo.getFavorites();
    result.fold(
      (failure) {
        emit(FavoritesFailureState());
      },
      (favoritesData) {
        favoriteModel = favoritesData;

        emit(FavoritesSuccessState());
      },
    );
  }

  changeFavorites({required int productId}) async {
    FavoritesManager.favorites[productId] =
        !FavoritesManager.favorites[productId]!;
    emit(ChangeFavoritesState());
    // emit(ChangeFavoritesLoadingState());
    var result = await _favoritesRepo.changeFavorites(id: productId);
    result.fold(
      (failure) {
        FavoritesManager.favorites[productId] =
            !FavoritesManager.favorites[productId]!;
        emit(ChangeFavoritesFailureState());
      },
      (changeFavoriteData) {
        changeFavoriteModel = changeFavoriteData;
        if (!changeFavoriteData.status) {
          FavoritesManager.favorites[productId] =
              !FavoritesManager.favorites[productId]!;
        } else {
          getFavorites();
        }
        emit(ChangeFavoritesSuccessState(model: changeFavoriteData));
      },
    );
  }
}
