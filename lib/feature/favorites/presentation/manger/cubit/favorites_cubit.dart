import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/favorites/data/repos/favorites_repo.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._favoritesRepo) : super(FavoritesInitialState());

  static FavoritesCubit get(context) => BlocProvider.of(context);

  final FavoritesRepo _favoritesRepo;
  getFavorites() async {
    emit(FavoritesLoadingState());
    var result = await _favoritesRepo.getFavorites();
    result.fold(
      (failure) {
        emit(FavoritesFailureState());
      },
      (favoritesData) {
        emit(FavoritesSuccessState());
      },
    );
  }
}