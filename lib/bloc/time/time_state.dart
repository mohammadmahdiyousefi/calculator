import 'package:calculator/model/capabilities.dart';
import 'package:flutter/material.dart';

abstract class ITimeState {}

class TimeState extends ITimeState {
  TextEditingController value;
  Capabilities item;
  Capabilities item1;
  TextEditingController result;
  TimeState(this.value, this.item, this.item1, this.result);
}
