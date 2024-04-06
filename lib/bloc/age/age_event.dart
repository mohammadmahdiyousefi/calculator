abstract class AgeEvent {}

class AgeEventCalculate extends AgeEvent {}

class AgeEventSetTo extends AgeEvent {
  final DateTime to;
  AgeEventSetTo(this.to);
}

class AgeEventSetFrom extends AgeEvent {
  final DateTime from;
  AgeEventSetFrom(this.from);
}
