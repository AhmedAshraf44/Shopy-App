import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/bloc_observer.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/functions/app_theme_data.dart';
import 'package:shopy_app/core/utils/app_router.dart';
import 'package:shopy_app/core/utils/cache_helper.dart';
import 'package:shopy_app/core/utils/service_locator.dart';

import 'feature/favorites/data/repos/favorites_repo_impl.dart';
import 'feature/favorites/presentation/manger/cubit/favorites_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token') ?? '';
  // print(token);
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  late String initialRoute;
  if (onBoarding != null) {
    if (token.isNotEmpty) {
      initialRoute = AppRouter.kHomeLayoutView;
    } else {
      initialRoute = AppRouter.kLoginView;
    }
  } else {
    initialRoute = AppRouter.kLoginView;
  }
  runApp(ShopyApp(initialRoute: initialRoute));
}

class ShopyApp extends StatelessWidget {
  const ShopyApp({super.key, required this.initialRoute});
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(
        getIt.get<FavoritesRepoImpl>(),
      )..getFavorites(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router(initialRoute: initialRoute),
        theme: appThemeData(),
      ),
    );
  }
}
