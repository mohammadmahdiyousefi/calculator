import 'package:age_calculator/age_calculator.dart';

abstract class IAgeState {}

class AgeState extends IAgeState {
  DateTime birthdate;
  DateTime curentdate;
  String minuts;
  String hour;
  String day;
  String week;
  String months;
  String year;
  DateDuration age;
  DateDuration nextbirthday;
  AgeState(this.curentdate, this.birthdate, this.minuts, this.hour, this.day,
      this.week, this.months, this.year, this.age, this.nextbirthday);
}
