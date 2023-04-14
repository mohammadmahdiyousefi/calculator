import 'package:calculator/constanc/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darktheme = ThemeData(
    scaffoldBackgroundColor: AppColor.black,
    unselectedWidgetColor: Colors.white,
    colorScheme: const ColorScheme.dark(),
    primaryColor: AppColor.darkprimaryColor,
    textTheme: TextTheme(
        displayLarge: const TextStyle(
            color: AppColor.white, fontSize: 25, fontWeight: FontWeight.w300),
        displayMedium: TextStyle(color: AppColor.costumemgrey, fontSize: 45),
        bodyLarge: TextStyle(color: AppColor.white)),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: AppColor.brightorange, size: 25),
        backgroundColor: AppColor.black,
        titleTextStyle: TextStyle(color: AppColor.brightorange, fontSize: 25)),
  );

  static final lighttheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    unselectedWidgetColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    primaryColor: AppColor.lightprimaryColor,
    textTheme: TextTheme(
        displayLarge: const TextStyle(
            color: AppColor.black, fontSize: 30, fontWeight: FontWeight.w400),
        displayMedium:
            TextStyle(color: AppColor.costumembrightgrey, fontSize: 45)),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: AppColor.brightorange, size: 25),
        backgroundColor: AppColor.white,
        titleTextStyle: TextStyle(color: AppColor.brightorange, fontSize: 25)),
  );
}
