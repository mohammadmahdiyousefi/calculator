abstract class IAgeEvent {}

class AgeEvent extends IAgeEvent {
  DateTime birthdaydate;
  AgeEvent(this.birthdaydate);
}
