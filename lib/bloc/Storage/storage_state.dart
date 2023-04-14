import 'package:calculator/model/capabilities.dart';

abstract class IStorageState {}

class StorageState extends IStorageState {
  String value;
  Capabilities item;
  Capabilities item1;
  double result;
  StorageState(this.value, this.item, this.item1, this.result);
}
