import 'package:calculator/model/capabilities.dart';

abstract class ITempetatureState {}

class TempetatureState extends ITempetatureState {
  String value;
  Capabilities item;
  Capabilities item1;
  double result;
  TempetatureState(this.value, this.item, this.item1, this.result);
}
