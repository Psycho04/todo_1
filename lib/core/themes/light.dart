import 'package:flutter/material.dart';

class MyLightTheme {
  static const Color primaryblue = Color(0xff5D9CEC);
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xffDFECDB),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: primaryblue,
      centerTitle: true
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryblue,
      primary: primaryblue,
      onPrimary: Colors.white,
      secondary: Colors.black,
      onSecondary: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(
          size: 33,
          color: primaryblue,
        ),
        unselectedIconTheme: IconThemeData(size: 33, color: Color(0xffC8C9CB))),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primaryblue),
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xffA9A9A9)),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto',color: Color(0xffA9A9A9),)
    ),
  );
}
