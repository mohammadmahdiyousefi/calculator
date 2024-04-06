import 'package:auto_size_text/auto_size_text.dart';
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
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: property.bottomcolor!.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            )
          ],
          color: property.bottomcolor,
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.shortestSide / 28)),
      child: Center(
        child: property.titel == '⇌'
            ? const Icon(
                Icons.sync,
                color: AppColor.white,
              )
            : AutoSizeText(property.titel,
                textAlign: TextAlign.center,
                minFontSize: 3,
                style: GoogleFonts.roboto(
                    fontSize: 26,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: property.titelcolor)),
      ),
    );

    //  Card(
    //   color: property.bottomcolor,
    //   shadowColor: property.bottomcolor,
    //   elevation: 1,
    //   margin: const EdgeInsets.all(8),
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(
    //           MediaQuery.of(context).size.shortestSide / 28)),
    //   child: SizedBox(
    //     height: keysize,
    //     width: keysize,
    //     child: Center(
    //       child: property.titel == '⇌'
    //           ? const Icon(
    //               Icons.sync,
    //               color: AppColor.white,
    //             )
    //           : Text(property.titel,
    //               textAlign: TextAlign.center,
    //               style: GoogleFonts.lato(
    //                   fontSize: keytitelsize,
    //                   fontStyle: FontStyle.normal,
    //                   fontWeight: FontWeight.w600,
    //                   color: property.titelcolor)),
    //     ),
    //   ),
    // );
  }
}
