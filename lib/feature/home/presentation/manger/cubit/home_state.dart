part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSucessState extends HomeState {}

final class HomeFailureState extends HomeState {
  final String errMessage;

  HomeFailureState(this.errMessage);
}

final class CategoriesLoadingState extends HomeState {}

final class CategoriesSucessState extends HomeState {}

final class CategoriesFailureState extends HomeState {
  final String errMessage;

  CategoriesFailureState(this.errMessage);
}

final class HomeChnageIndexState extends HomeState {}
