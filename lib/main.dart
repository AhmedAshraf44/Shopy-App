import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopy_app/bloc_observer.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/utils/app_router.dart';
import 'package:shopy_app/core/utils/cache_helper.dart';
import 'package:shopy_app/core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token') ?? '';
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router(initialRoute: initialRoute),
      theme: appThemeData(),
    );
  }
}

ThemeData appThemeData() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.white,
      ),
      fontFamily: 'Inter',
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: kPrimaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kPrimaryColor,
      ));
}
