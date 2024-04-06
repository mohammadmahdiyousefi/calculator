import 'package:calculator/bloc/age/from_state.dart';
import 'package:calculator/bloc/age/result_state.dart';
import 'package:calculator/bloc/age/to_state.dart';

class AgeState {
  final ToState to;
  final FromState from;
  final ResultState result;
  const AgeState({required this.to, required this.from, required this.result});
  AgeState copyWith(
      {ToState? newto, FromState? newfrom, ResultState? newresult}) {
    return AgeState(
        to: newto ?? to, from: newfrom ?? from, result: newresult ?? result);
  }
}
