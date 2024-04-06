import 'package:calculator/bloc/calculator/input_calculator.dart';
import 'package:calculator/bloc/calculator/result_calculator.dart';

class CalculatorState {
  final ResultCalculatorState result;
  final InputCalculatorState input;
  const CalculatorState({required this.result, required this.input});
  CalculatorState copyWith({
    ResultCalculatorState? newresult,
    InputCalculatorState? newinput,
  }) {
    return CalculatorState(
        result: newresult ?? result, input: newinput ?? input);
  }
}
