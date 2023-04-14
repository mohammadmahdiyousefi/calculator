import 'package:calculator/model/capabilities.dart';

abstract class ITimeState {}

class TimeState extends ITimeState {
  String value;
  Capabilities item;
  Capabilities item1;
  double result;
  TimeState(this.value, this.item, this.item1, this.result);
}
