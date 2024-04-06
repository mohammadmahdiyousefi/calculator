import 'package:equatable/equatable.dart';

abstract class ResultCalculatorState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ResultCalculatorStateInital extends ResultCalculatorState {}

final class ResultCalculatorStateResult extends ResultCalculatorState {
  final String resultCalculator;
  ResultCalculatorStateResult({required this.resultCalculator});
  @override
  List<Object?> get props => [resultCalculator];
}

final class ResultCalculatorStateError extends ResultCalculatorState {
  final String error;
  ResultCalculatorStateError({required this.error});
  @override
  List<Object?> get props => [error];
}
