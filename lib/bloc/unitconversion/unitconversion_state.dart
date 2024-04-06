import 'package:calculator/bloc/unitconversion/from_state.dart';
import 'package:calculator/bloc/unitconversion/input_state.dart';
import 'package:calculator/bloc/unitconversion/result_state.dart';
import 'package:calculator/bloc/unitconversion/to_state.dart';

class UnitconversionState {
  final FromState from;
  final ToState to;
  final ResultState result;
  final InputState input;
  const UnitconversionState(
      {required this.from,
      required this.to,
      required this.result,
      required this.input});
  UnitconversionState copyWith({
    FromState? newfrom,
    ToState? newto,
    ResultState? newresult,
    InputState? newinput,
  }) {
    return UnitconversionState(
        from: newfrom ?? from,
        to: newto ?? to,
        result: newresult ?? result,
        input: newinput ?? input);
  }
}
