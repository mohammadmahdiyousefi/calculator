import 'package:flutter/material.dart';

abstract class IBmiState {}

class BmiState extends IBmiState {
  Color color;
  String height;
  String weight;
  double result;
  BmiState(this.color, this.height, this.weight, this.result);
}
