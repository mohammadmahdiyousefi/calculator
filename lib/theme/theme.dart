import 'package:flutter/material.dart';

class AppTheme {
//=============== Drak Theme ===================================================
  static final darktheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      unselectedWidgetColor: Colors.white,
      cardColor: const Color(0xff242424),
      primaryColor: const Color(0xffed8114),
      listTileTheme: const ListTileThemeData(
        titleTextStyle: TextStyle(
            fontFamily: 'ROBR',
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        subtitleTextStyle: TextStyle(
            fontFamily: 'ROBR',
            fontSize: 10,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Color(0xffb2b2b2)),
        leadingAndTrailingTextStyle: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 12,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Color(0xffb2b2b2),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
            fontFamily: 'ROBR',
            fontSize: 28,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF)),
        labelMedium: TextStyle(
            fontFamily: 'ROBR',
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF)),
        bodyLarge: TextStyle(
            fontFamily: 'ROBR',
            fontSize: 26,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF)),
        bodyMedium: TextStyle(
            fontFamily: 'ROBR',
            fontSize: 26,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF)),
        bodySmall: TextStyle(
            fontFamily: 'ROBR',
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF)),
        displayMedium: TextStyle(
            fontFamily: 'ROBR',
            fontSize: 26,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Color(0xffb2b2b2)),
        displayLarge: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 36,
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        backgroundColor: Colors.black,
        //-------------------- App Bar Text titel ------------------------------------
        titleTextStyle: TextStyle(
          fontFamily: 'ROBM',
          fontSize: 16,
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white));
//============== Light Theme ===================================================
  static final lighttheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xfff7f7f7),
    unselectedWidgetColor: Colors.black,
    cardColor: Colors.white,
    primaryColor: const Color(0xfffd8310),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 12,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Colors.black),
      subtitleTextStyle: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 10,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Color(0xffcdcdcd)),
      leadingAndTrailingTextStyle: TextStyle(
        fontFamily: 'ROBR',
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: Color(0xffcdcdcd),
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 28,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000)),
      labelMedium: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: Color(0xFF000000)),
      bodyLarge: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 26,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: Color(0xFF000000)),
      bodyMedium: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 26,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: Color(0xFF000000)),
      bodySmall: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 12,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: Color(0xFF000000)),
      displayMedium: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 26,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: Color(0xffcdcdcd)),
      displayLarge: TextStyle(
          fontFamily: 'ROBR',
          fontSize: 36,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black, size: 25),
      backgroundColor: Color(0xfff7f7f7),
      //-------------------- App Bar Text titel --------------------------------
      titleTextStyle: TextStyle(
        fontFamily: 'ROBM',
        fontSize: 16,
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
}
