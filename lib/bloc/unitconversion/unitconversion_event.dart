import '../../model/capabilities.dart';

abstract class IUnitconversionEvent {}

class Unitconversion extends IUnitconversionEvent {
  String value;
  Unitconversion(this.value);
}

class Unit extends IUnitconversionEvent {
  Capabilities unit;
  Unit(this.unit);
}

class Unit1 extends IUnitconversionEvent {
  Capabilities unit1;
  Unit1(this.unit1);
}

class Settitel extends IUnitconversionEvent {
  String titel;
  Settitel(this.titel);
}
