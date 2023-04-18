import 'package:calculator/model/capabilities.dart';
import 'package:flutter/material.dart';

abstract class ISpeedState {}

class SpeedState extends ISpeedState {
  TextEditingController value;
  Capabilities item;
  Capabilities item1;
  TextEditingController result;
  SpeedState(this.value, this.item, this.item1, this.result);
}
