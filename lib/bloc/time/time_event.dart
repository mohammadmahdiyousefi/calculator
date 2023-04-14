import 'package:calculator/model/capabilities.dart';

abstract class ITimeEvent {}

class TimeEvent extends ITimeEvent {
  String value;
  TimeEvent(this.value);
}

class ItemEvent extends ITimeEvent {
  Capabilities item;

  ItemEvent(this.item);
}

class Item1Event extends ITimeEvent {
  Capabilities item1;
  Item1Event(this.item1);
}
