import 'package:calculator/model/capabilities.dart';

abstract class IAreaState {}

class AreaState extends IAreaState {
  String value;
  Capabilities item;
  Capabilities item1;
  double result;
  AreaState(this.value, this.item, this.item1, this.result);
}
