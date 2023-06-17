import 'package:flutter/material.dart';

abstract class ICalculatorState {}

class CalculatorState extends ICalculatorState {
  String calculate;
  String result;
  CalculatorState(this.result, this.calculate);
}

class CalculatorErrorState extends ICalculatorState {
  TextEditingController calculate;
  TextEditingController result;
  CalculatorErrorState(this.result, this.calculate);
}
