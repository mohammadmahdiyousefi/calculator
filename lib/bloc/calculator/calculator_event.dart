import 'package:flutter/material.dart';

abstract class ICalculatorEvent {}

class CalculatorEvent extends ICalculatorEvent {
  String value;
  CalculatorEvent(this.value);
}

class CalculatorEventdoubletap extends ICalculatorEvent {}
