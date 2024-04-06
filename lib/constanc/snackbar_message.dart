import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackbarMessage {
  static void customsnackbar(BuildContext context, String text, Color? color) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        style: GoogleFonts.roboto(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
    ));
  }
}
