import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/home/data/repos/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    var result = await homeRepo.getHomeData();
    result.fold(
      (failure) {
        emit(HomeFailureState(failure.toString()));
      },
      (homeData) {
        emit(HomeSucessState());
      },
    );
  }
}
