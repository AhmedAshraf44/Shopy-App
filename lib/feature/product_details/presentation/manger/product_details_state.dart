sealed class ProductDetailsState {}

final class ProductDetailsInitialState extends ProductDetailsState {}

final class ProductDetailsLoadingState extends ProductDetailsState {}

final class ProductDetailsSucessState extends ProductDetailsState {}

final class ProductDetailsFailureState extends ProductDetailsState {
  final String errMessage;

  ProductDetailsFailureState(this.errMessage);
}

final class ProductDetailsChnageIndexState extends ProductDetailsState {}
