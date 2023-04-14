import 'package:calculator/model/capabilities.dart';

abstract class ITempetatureEvent {}

class TempetatureEvent extends ITempetatureEvent {
  String value;
  TempetatureEvent(this.value);
}

class ItemEvent extends ITempetatureEvent {
  Capabilities item;

  ItemEvent(this.item);
}

class Item1Event extends ITempetatureEvent {
  Capabilities item1;
  Item1Event(this.item1);
}
