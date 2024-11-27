import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/home/data/model/categories_model/categories_model.dart';
import 'package:shopy_app/feature/home/data/model/home_model/home_model.dart';
import 'package:shopy_app/feature/home/data/repos/home_repo.dart';

import '../../../../../core/utils/models/favorites_manager.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  HomeModel? homeModel;
  CategoriesModel? categoriesModel;
  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  int currentIndex = 0;

  void changeCurrentIndex(index) {
    currentIndex = index;
    emit(HomeChnageIndexState());
  }

  //Map<int, bool> favorites = {};

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    var result = await homeRepo.getHomeData();
    result.fold(
      (failure) {
        emit(HomeFailureState(failure.toString()));
      },
      (homeData) {
        homeModel = homeData;
        homeData.data.products.forEach(
          (element) {
            FavoritesManager.favorites.addAll({element.id: element.favorites});
          },
        );
        emit(HomeSucessState());
      },
    );
  }

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    var result = await homeRepo.getCategories();
    result.fold(
      (failure) => emit(CategoriesFailureState(failure.errorMessage)),
      (categories) {
        categoriesModel = categories;
        emit(CategoriesSucessState());
      },
    );
  }
}
