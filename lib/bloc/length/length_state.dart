import 'package:calculator/model/capabilities.dart';

abstract class ILengthState {}

class LengthState extends ILengthState {
  String value;
  Capabilities item;
  Capabilities item1;
  double result;
  LengthState(this.value, this.item, this.item1, this.result);
}
