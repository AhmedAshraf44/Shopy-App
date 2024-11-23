part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesInitialState extends FavoritesState {}

final class FavoritesLoadingState extends FavoritesState {}

final class FavoritesSuccessState extends FavoritesState {}

final class FavoritesFailureState extends FavoritesState {}
