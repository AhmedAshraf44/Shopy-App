import 'package:flutter/material.dart';

import '../../constants.dart';

ThemeData appThemeData() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.white,
      ),
      fontFamily: 'Inter',
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: kPrimaryColor),
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
