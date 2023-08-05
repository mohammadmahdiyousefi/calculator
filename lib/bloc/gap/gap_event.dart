import 'package:calculator/model/gap.dart';

abstract class IGapEvent {}

class GapEvent extends IGapEvent {}

class AddGapEvent extends IGapEvent {
  Gap gap;
  AddGapEvent(this.gap);
}

class EditGapEvent extends IGapEvent {
  Gap gap;
  Gap newgap;
  int index;
  EditGapEvent(this.gap, this.newgap, this.index);
}

class DeletGapEvent extends IGapEvent {
  Gap gap;

  DeletGapEvent(
    this.gap,
  );
}

class CalculatGapEvent extends IGapEvent {}
