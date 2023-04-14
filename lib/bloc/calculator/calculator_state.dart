abstract class ICalculatorState {}

class CalculatorState extends ICalculatorState {
  String calculate;
  String result;
  CalculatorState(this.result, this.calculate);
}

class CalculatorErrorState extends ICalculatorState {
  String calculate;
  String result;
  CalculatorErrorState(this.result, this.calculate);
}
