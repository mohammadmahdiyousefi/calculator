import 'package:flutter/material.dart';

class ButtonModel {
  String titel;
  Color? titelcolor;
  Color? bottomcolor;

  ButtonModel({
    this.bottomcolor = Colors.grey,
    this.titel = '',
    this.titelcolor = Colors.white,
  });
}
