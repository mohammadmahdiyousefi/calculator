import 'package:flutter/material.dart';

class BottomModel {
  String titel;
  Color? titelcolor;
  Color? bottomcolor;
  double? fontsize;
  BottomModel({
    this.bottomcolor = Colors.grey,
    this.fontsize = 30,
    this.titel = '',
    this.titelcolor = Colors.white,
  });
}
