import 'package:calculator/model/capabilities.dart';

abstract class ILengthEvent {}

class LengthEvent extends ILengthEvent {
  String value;
  LengthEvent(this.value);
}

class ItemEvent extends ILengthEvent {
  Capabilities item;

  ItemEvent(this.item);
}

class Item1Event extends ILengthEvent {
  Capabilities item1;
  Item1Event(this.item1);
}
