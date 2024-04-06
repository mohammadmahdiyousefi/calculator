import 'package:calculator/constanc/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
//=============== Drak Theme ===================================================
  static final darktheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.black,
      unselectedWidgetColor: Colors.white,
      cardColor: AppColor.customcardcolordark,
      canvasColor: AppColor.numberbottomcolor,
      primaryColor: AppColor.customorange,
      primaryColorLight: AppColor.brightorange,
      primaryColorDark: AppColor.bottomcolor,
      listTileTheme: ListTileThemeData(
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        subtitleTextStyle: GoogleFonts.roboto(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: AppColor.costumembrightgrey),
      ),
      textTheme: TextTheme(
//---------------- selected item style -----------------------------------------
        bodySmall: GoogleFonts.roboto(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        bodyLarge: GoogleFonts.roboto(
            fontSize: 28,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: AppColor.brightorange),
        bodyMedium: GoogleFonts.roboto(
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: AppColor.costumemgrey),
        labelLarge: GoogleFonts.roboto(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            color: AppColor.customorange),
        labelSmall: GoogleFonts.roboto(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        displayMedium: GoogleFonts.roboto(
            fontSize: 26,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: AppColor.costumembrightgrey),
        displayLarge: GoogleFonts.roboto(
          fontSize: 36,
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
//----------------- bmi --------------------------------------------------------
        labelMedium: GoogleFonts.roboto(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
//--------------- App Bar theme ------------------------------------------------
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: AppColor.white, size: 25),
        backgroundColor: AppColor.black,
        //-------------------- App Bar Text titel ------------------------------------
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white)
//------------------------------------------------------------------------------
      );
//============== Light Theme ===================================================
  static final lighttheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.white,
      unselectedWidgetColor: Colors.black,
      cardColor: AppColor.customcardcolor,
      primaryColor: AppColor.customorange,
      primaryColorLight: AppColor.brightorange,
      canvasColor: AppColor.numberbottomcolor,
      primaryColorDark: AppColor.bottomcolor,
      listTileTheme: ListTileThemeData(
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        subtitleTextStyle: GoogleFonts.roboto(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: AppColor.costumemgrey),
      ),
      textTheme: TextTheme(
//---------------- selected item style -----------------------------------------
        bodySmall: GoogleFonts.roboto(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        bodyMedium: GoogleFonts.roboto(
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: AppColor.costumembrightgrey),
        bodyLarge: GoogleFonts.roboto(
            fontSize: 28,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: AppColor.brightorange),
        labelLarge: GoogleFonts.roboto(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            color: AppColor.customorange),
        labelSmall: GoogleFonts.roboto(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        displayMedium: GoogleFonts.roboto(
            fontSize: 26,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: AppColor.costumemgrey),
        displayLarge: GoogleFonts.roboto(
            fontSize: 36,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.black),

//----------------- bmi --------------------------------------------------------
        labelMedium: GoogleFonts.roboto(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.black),

//------------------ BMI information--------------------------------------------
      ),
//--------------- App Bar theme ------------------------------------------------
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: AppColor.black, size: 25),
        backgroundColor: AppColor.white,
        //-------------------- App Bar Text titel --------------------------------
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: AppColor.black),
      ),
      iconTheme: const IconThemeData(color: Colors.black)
//------------------------------------------------------------------------------
      );
}
