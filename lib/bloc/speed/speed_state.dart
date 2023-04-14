import 'package:calculator/model/capabilities.dart';

abstract class ISpeedState {}

class SpeedState extends ISpeedState {
  String value;
  Capabilities item;
  Capabilities item1;
  double result;
  SpeedState(this.value, this.item, this.item1, this.result);
}
