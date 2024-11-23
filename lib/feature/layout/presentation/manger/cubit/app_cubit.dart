import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/categories/presentation/view/categories_view.dart';
import 'package:shopy_app/feature/favorites/presentation/view/favorites_view.dart';
import 'package:shopy_app/feature/home/presentation/view/home_view.dart';
import 'package:shopy_app/feature/settings/presentation/view/settings_view.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List pages = const [
    HomeView(),
    CategoriesView(),
    FavoritesView(),
    SettingsView(),
  ];

  void changeBottomNavIndex(index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}
