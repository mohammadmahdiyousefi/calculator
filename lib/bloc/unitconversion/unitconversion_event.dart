import '../../model/capabilities.dart';

abstract class IUnitconversionEvent {}

final class UnitconversionInitial extends IUnitconversionEvent {
  final Capabilities from;
  final Capabilities to;
  UnitconversionInitial(this.from, this.to);
}

final class Unitconversion extends IUnitconversionEvent {
  final String input;
  Unitconversion(this.input);
}

final class UnitconversionAC extends IUnitconversionEvent {}

final class UnitconversionCE extends IUnitconversionEvent {}

final class UnitconversionCETimer extends IUnitconversionEvent {}

final class UnitconversionCETimerCancel extends IUnitconversionEvent {}

final class UnitconversionChange extends IUnitconversionEvent {}

final class FromUnit extends IUnitconversionEvent {
  final Capabilities from;
  FromUnit(this.from);
}

final class ToUnit extends IUnitconversionEvent {
  final Capabilities to;
  ToUnit(this.to);
}
