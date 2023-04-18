import 'package:calculator/model/capabilities.dart';
import 'package:flutter/material.dart';

abstract class ITempetatureState {}

class TempetatureState extends ITempetatureState {
  TextEditingController value;
  Capabilities item;
  Capabilities item1;
  TextEditingController result;
  TempetatureState(this.value, this.item, this.item1, this.result);
}
