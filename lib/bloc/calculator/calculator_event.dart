abstract class ICalculatorEvent {}

class CalculatorEvent extends ICalculatorEvent {
  String value;
  CalculatorEvent(this.value);
}

class CalculatorEventInitial extends ICalculatorEvent {}
