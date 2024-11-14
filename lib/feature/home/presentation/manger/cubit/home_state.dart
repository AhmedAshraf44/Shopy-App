part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSucessState extends HomeState {}

final class HomeFailureState extends HomeState {
  final String errMessage;

  HomeFailureState(this.errMessage);
}

final class GategoriesLoadingState extends HomeState {}

final class GategoriesSucessState extends HomeState {}

final class GategoriesFailureState extends HomeState {
  final String errMessage;

  GategoriesFailureState(this.errMessage);
}

final class HomeChnageIndexState extends HomeState {}
