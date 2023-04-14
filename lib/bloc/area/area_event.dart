import 'package:calculator/model/capabilities.dart';

abstract class IAreaEvent {}

class AreaEvent extends IAreaEvent {
  String value;
  AreaEvent(this.value);
}

class ItemEvent extends IAreaEvent {
  Capabilities item;

  ItemEvent(this.item);
}

class Item1Event extends IAreaEvent {
  Capabilities item1;
  Item1Event(this.item1);
}
