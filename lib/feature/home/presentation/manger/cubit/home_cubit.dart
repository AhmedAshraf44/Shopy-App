import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/home/data/repos/home_repo_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepoImpl) : super(HomeInitial());

  HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepoImpl homeRepoImpl;
  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    var result = await homeRepoImpl.getHomeData();
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
