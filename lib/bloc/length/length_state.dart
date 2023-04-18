import 'package:calculator/model/capabilities.dart';
import 'package:flutter/material.dart';

abstract class ILengthState {}

class LengthState extends ILengthState {
  TextEditingController value = TextEditingController();
  Capabilities item;
  Capabilities item1;
  TextEditingController result = TextEditingController();
  LengthState(this.value, this.item, this.item1, this.result);
}
