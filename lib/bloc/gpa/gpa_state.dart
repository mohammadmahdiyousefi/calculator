import 'package:calculator/model/gpa_class.dart';

abstract class GpaState {}

class InitGpa extends GpaState {
  final List<GPA> gpas;
  final double grade;
  final int unitstotal;
  InitGpa(this.gpas, this.grade, this.unitstotal);
}

class GpaStateComplet extends GpaState {
  final List<GPA> gpas;
  final double grade;
  final int unitstotal;
  GpaStateComplet(this.gpas, this.grade, this.unitstotal);
}
