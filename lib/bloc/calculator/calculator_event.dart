abstract class ICalculatorEvent {}

class CalculatorEvent extends ICalculatorEvent {
  String value;
  CalculatorEvent(this.value);
}

class CalculatorEventInitial extends ICalculatorEvent {}

class CalculatorAC extends ICalculatorEvent {}

class CalculatorCE extends ICalculatorEvent {}

class CalculatorCETimer extends ICalculatorEvent {}

class CalculatorCETimerCancel extends ICalculatorEvent {}

class CalculatorEqual extends ICalculatorEvent {}
