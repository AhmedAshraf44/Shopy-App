import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/favorites/data/models/change_favorite_model.dart';
import 'package:shopy_app/feature/favorites/data/repos/favorites_repo.dart';

import '../../../data/models/favorite_model/favorite_model.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._favoritesRepo) : super(FavoritesInitialState());

  static FavoritesCubit get(context) => BlocProvider.of(context);
  FavoriteModel? favoriteModel;
  ChangeFavoriteModel? changeFavoriteModel;
  final FavoritesRepo _favoritesRepo;
  List? favorites = [];
  getFavorites() async {
    emit(FavoritesLoadingState());
    var result = await _favoritesRepo.getFavorites();
    result.fold(
      (failure) {
        print('failure $failure');
        emit(FavoritesFailureState());
      },
      (favoritesData) {
        print('trueeeeeeeeee');

        favoriteModel = favoritesData;
        //favorites = favoritesData.data?.data ?? [];
        // print(favorites?[0] ?? "NULL");
        print('two trueeeeeeeeee');

        emit(FavoritesSuccessState());
      },
    );
  }

  changeFavorites({required int productId}) async {
    emit(ChangeFavoritesLoadingState());
    var result = await _favoritesRepo.changeFavorites(id: productId);
    result.fold(
      (failure) {
        emit(ChangeFavoritesFailureState());
      },
      (changeFavoriteData) {
        changeFavoriteModel = changeFavoriteData;
        getFavorites();
        emit(ChangeFavoritesSuccessState());
      },
    );
  }
}
