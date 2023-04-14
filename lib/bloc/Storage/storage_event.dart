import 'package:calculator/model/capabilities.dart';

abstract class IStorageEvent {}

class StorageEvent extends IStorageEvent {
  String value;
  StorageEvent(this.value);
}

class ItemEvent extends IStorageEvent {
  Capabilities item;

  ItemEvent(this.item);
}

class Item1Event extends IStorageEvent {
  Capabilities item1;
  Item1Event(this.item1);
}
