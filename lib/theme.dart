import 'package:calculator/constanc/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
//=============== Drak Theme ===================================================
  static final darktheme = ThemeData(
    scaffoldBackgroundColor: AppColor.black,
    unselectedWidgetColor: Colors.white,
    colorScheme: const ColorScheme.dark(),
    primaryColor: AppColor.darkprimaryColor,
    textTheme: TextTheme(
//---------------- selected item style -----------------------------------------
        bodySmall: GoogleFonts.roboto(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.white),
//---------------- input user --------------------------------------------------
        bodyMedium: GoogleFonts.lato(
            fontSize: 30,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: AppColor.brightorange),
//---------------- result ------------------------------------------------------
        bodyLarge: GoogleFonts.lato(
            fontSize: 30,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: AppColor.costumemgrey),
//---------------- unit text style ---------------------------------------------
        labelSmall: GoogleFonts.lato(
            fontSize: 18,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.white),
//------------------ BMI information--------------------------------------------
        labelMedium: GoogleFonts.lato(
            fontSize: 15,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.white),
//------------------ calculator input user -------------------------------------
        displayMedium: GoogleFonts.lato(
            fontSize: 30,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.white),
//------------------ calculator result  ----------------------------------------
        displayLarge: GoogleFonts.lato(
          fontSize: 45,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
        )),
//--------------- App Bar theme ------------------------------------------------
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: AppColor.brightorange, size: 25),
      backgroundColor: AppColor.black,
      //-------------------- App Bar Text titel ------------------------------------
      titleTextStyle: GoogleFonts.roboto(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColor.brightorange),
    ),
//------------------------------------------------------------------------------
  );
//============== Light Theme ===================================================
  static final lighttheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    unselectedWidgetColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    primaryColor: AppColor.lightprimaryColor,

    textTheme: TextTheme(
//---------------- selected item style -----------------------------------------
      bodySmall: GoogleFonts.roboto(
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          color: Colors.black),
//---------------- input user --------------------------------------------------
      bodyMedium: GoogleFonts.lato(
          fontSize: 30,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          color: AppColor.brightorange),
//---------------- result ------------------------------------------------------
      bodyLarge: GoogleFonts.lato(
          fontSize: 30,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          color: AppColor.costumembrightgrey),
//---------------- unit text style ---------------------------------------------
      labelSmall: GoogleFonts.lato(
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: Colors.black),
//------------------ BMI information--------------------------------------------
      labelMedium: GoogleFonts.lato(
          fontSize: 15,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: Colors.white),
//------------------ calculator input user
//------------------ calculator input user -------------------------------------
      displayMedium: GoogleFonts.lato(
          fontSize: 30,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w300,
          color: Colors.black),
//------------------ calculator result  ----------------------------------------
      displayLarge: GoogleFonts.lato(
          fontSize: 40,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          color: AppColor.costumembrightgrey),
    ),
//--------------- App Bar theme ------------------------------------------------
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: AppColor.brightorange, size: 25),
      backgroundColor: AppColor.white,
      //-------------------- App Bar Text titel --------------------------------
      titleTextStyle: GoogleFonts.roboto(
          fontSize: 25,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: AppColor.brightorange),
    ),
//------------------------------------------------------------------------------
  );
}
