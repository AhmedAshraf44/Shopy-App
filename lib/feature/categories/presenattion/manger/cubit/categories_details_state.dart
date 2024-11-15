part of 'categories_details_cubit.dart';

sealed class CategoriesDetailsState {}

final class CategoriesDetailsInitial extends CategoriesDetailsState {}

final class CategoriesDetailsLoadingState extends CategoriesDetailsState {}

final class CategoriesDetailsSucessState extends CategoriesDetailsState {}

final class CategoriesDetailsFailureState extends CategoriesDetailsState {
  final String errMessage;

  CategoriesDetailsFailureState(this.errMessage);
}
