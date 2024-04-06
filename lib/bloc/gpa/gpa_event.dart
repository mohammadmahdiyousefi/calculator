import 'package:calculator/model/gpa_class.dart';

abstract class GpaEvent {}

class AddGpaEvent extends GpaEvent {
  final GPA gpa;
  AddGpaEvent(this.gpa);
}

class EditGpaEvent extends GpaEvent {
  final GPA gpa;
  final GPA newgap;
  final int index;
  EditGpaEvent(this.gpa, this.newgap, this.index);
}

class DeletGpaEvent extends GpaEvent {
  final GPA gpa;

  DeletGpaEvent(
    this.gpa,
  );
}
