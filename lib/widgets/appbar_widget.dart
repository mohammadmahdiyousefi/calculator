import 'package:flutter/material.dart';

PreferredSizeWidget appbarwidget(
    {required BuildContext context, String titel = 'Appbar'}) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    iconTheme: Theme.of(context).appBarTheme.iconTheme,
    elevation: 0,
    title: Text(titel, style: Theme.of(context).appBarTheme.titleTextStyle),
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
