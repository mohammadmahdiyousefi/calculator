import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constanc/app_colors.dart';

PreferredSizeWidget appbarwidget(
    {required BuildContext context, String titel = 'Appbar'}) {
  return AppBar(
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    iconTheme: Theme.of(context).appBarTheme.iconTheme,
    elevation: 0,
    title: AutoSizeText(
      titel,
      minFontSize: 5,
      style: GoogleFonts.roboto(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColor.brightorange),
    ),
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back_ios,
      ),
    ),
  );
}
