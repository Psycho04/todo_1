import 'package:flutter/material.dart';
import 'package:todo_1/core/themes/light.dart';

class MyDarkTheme {
  static const Color darkGrey = Color(0xff141922);
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xff060E1E),
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkGrey,
      primary: darkGrey,
      onPrimary: darkGrey,
      secondary: Colors.white,
      onSecondary: darkGrey
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: darkGrey,
      selectedIconTheme: IconThemeData(
        size: 33,
        color: MyLightTheme.primaryblue,
      ),
      unselectedIconTheme: IconThemeData(
        size: 33,
        color: Color(0xffC8C9CB)
      )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(side: BorderSide(color: Colors.black, width: 3))
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: darkGrey),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Color(0xffA9A9A9)),
    ),
    hintColor: Colors.white,
  );
  
}