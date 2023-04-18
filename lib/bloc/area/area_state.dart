import 'package:calculator/model/capabilities.dart';
import 'package:flutter/widgets.dart';

abstract class IAreaState {}

class AreaState extends IAreaState {
  TextEditingController value;
  Capabilities item;
  Capabilities item1;
  TextEditingController result;
  AreaState(this.value, this.item, this.item1, this.result);
}
