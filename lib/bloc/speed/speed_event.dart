import 'package:calculator/model/capabilities.dart';

abstract class ISpeedEvent {}

class SpeedEvent extends ISpeedEvent {
  String value;
  SpeedEvent(this.value);
}

class ItemEvent extends ISpeedEvent {
  Capabilities item;

  ItemEvent(this.item);
}

class Item1Event extends ISpeedEvent {
  Capabilities item1;
  Item1Event(this.item1);
}
