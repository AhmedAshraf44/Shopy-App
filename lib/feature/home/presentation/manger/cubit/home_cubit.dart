import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/home/data/model/categories_model/categories_model.dart';
import 'package:shopy_app/feature/home/data/model/home_model/home_model.dart';
import 'package:shopy_app/feature/home/data/repos/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  HomeModel? homeModel;
  CategoriesModel? gategoriesModel;
  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  int currentIndex = 0;

  void changeCurrentIndex(index) {
    currentIndex = index;
    emit(HomeChnageIndexState());
  }

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    var result = await homeRepo.getHomeData();
    result.fold(
      (failure) {
        emit(HomeFailureState(failure.toString()));
      },
      (homeData) {
        homeModel = homeData;
        emit(HomeSucessState());
      },
    );
  }

  Future<void> getGategories() async {
    emit(GategoriesLoadingState());
    var result = await homeRepo.getGategories();
    result.fold(
      (failure) => emit(GategoriesFailureState(failure.errorMessage)),
      (gategories) {
        gategoriesModel = gategories;
        emit(GategoriesSucessState());
      },
    );
  }
}
