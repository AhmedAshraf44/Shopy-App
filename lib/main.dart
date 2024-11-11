import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopy_app/bloc_observer.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/utils/app_router.dart';
import 'package:shopy_app/core/utils/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  String? token = CacheHelper.getData(key: kToken);
  print('token : $token');
  runApp(const ShopyApp());
}

class ShopyApp extends StatelessWidget {
  const ShopyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
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
          )),
    );
  }
}
