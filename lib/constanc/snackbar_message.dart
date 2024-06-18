import 'package:flutter/material.dart';

class SnackbarMessage {
  static void customsnackbar(BuildContext context, String text, Color? color) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.white)),
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
    ));
  }
}
