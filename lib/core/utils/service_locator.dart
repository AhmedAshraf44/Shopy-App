import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopy_app/core/utils/api_service.dart';
import 'package:shopy_app/feature/categories/data/repos/categories_repo_impl.dart';
import 'package:shopy_app/feature/favorites/data/repos/favorites_repo_impl.dart';
import 'package:shopy_app/feature/home/data/repos/home_repo_impl.dart';

import '../../feature/login/data/repos/login_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<CategoriesRepoImpl>(CategoriesRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<FavoritesRepoImpl>(FavoritesRepoImpl(
    getIt.get<ApiService>(),
  ));
}
