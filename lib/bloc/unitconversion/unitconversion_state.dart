import 'package:flutter/material.dart';

import '../../model/capabilities.dart';

abstract class IUnitconversionState {}

class UnitconversionState extends IUnitconversionState {
  String value;
  Capabilities unit;
  Capabilities unit1;
  String result;
  UnitconversionState(this.value, this.unit, this.unit1, this.result);
}
