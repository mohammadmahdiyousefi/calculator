import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Bottom extends StatelessWidget {
  Bottom({super.key, required this.property});
  ButtonModel property;
  @override
  Widget build(BuildContext context) {
    double keysize = MediaQuery.of(context).size.shortestSide / 6;
    double keytitelsize = keysize / 2.5;
    return Card(
      color: property.bottomcolor,
      shadowColor: property.bottomcolor,
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.shortestSide / 28)),
      child: SizedBox(
        height: keysize,
        width: keysize,
        child: Center(
          child: property.titel == '⇌'
              ? const Icon(
                  Icons.sync,
                  color: AppColor.white,
                )
              : Text(property.titel,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontSize: keytitelsize,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: property.titelcolor)),
        ),
      ),
    );
  }
}
