import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/product_details/data/models/product_details_model.dart';
import 'package:shopy_app/feature/product_details/data/repos/product_details_repo.dart';
import 'package:shopy_app/feature/product_details/presentation/manger/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productDetailsRepo)
      : super(ProductDetailsInitialState());
  ProductDetailsModel? productDetailsModel;
  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  final ProductDetailsRepo _productDetailsRepo;
  void getProductDetails({required int id}) async {
    emit(ProductDetailsLoadingState());
    var result = await _productDetailsRepo.getProductDetails(id: id);
    result.fold(
      (failure) => emit(ProductDetailsFailureState(failure.errorMessage)),
      (productDetails) {
        productDetailsModel = productDetails;
        emit(ProductDetailsSucessState());
      },
    );
  }

  int currentIndex = 0;

  void changeCurrentIndex(index) {
    currentIndex = index;
    emit(ProductDetailsChnageIndexState());
  }
}
