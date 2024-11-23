import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/categories/data/repos/categories_repo.dart';
import '../../../data/models/categories_details_model.dart';

part 'categories_details_state.dart';

class CategoriesDetailsCubit extends Cubit<CategoriesDetailsState> {
  CategoriesDetailsCubit(this._categoriesRepo)
      : super(CategoriesDetailsInitial());
  CategoriesDetailsModel? categoriesDetailsModel;
  static CategoriesDetailsCubit get(context) => BlocProvider.of(context);
  final CategoriesRepo _categoriesRepo;
  void getCategoriesDetails({required int id}) async {
    emit(CategoriesDetailsLoadingState());
    var result = await _categoriesRepo.getCategoryDetails(id: id);
    result.fold(
      (failure) => emit(CategoriesDetailsFailureState(failure.errorMessage)),
      (categories) {
        categoriesDetailsModel = categories;
        emit(CategoriesDetailsSucessState());
      },
    );
  }
}
