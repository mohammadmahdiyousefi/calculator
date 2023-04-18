import 'package:calculator/model/capabilities.dart';
import 'package:flutter/material.dart';

abstract class IStorageState {}

class StorageState extends IStorageState {
  TextEditingController value;
  Capabilities item;
  Capabilities item1;
  TextEditingController result;
  StorageState(this.value, this.item, this.item1, this.result);
}
