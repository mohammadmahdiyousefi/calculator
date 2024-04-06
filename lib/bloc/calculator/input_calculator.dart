import 'package:equatable/equatable.dart';

abstract class InputCalculatorState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class InputCalculatorStateInital extends InputCalculatorState {}

final class InputCalculatorStateUser extends InputCalculatorState {
  final String input;
  InputCalculatorStateUser({required this.input});
  @override
  List<Object?> get props => [input];
}

final class InputCalculatorStateError extends InputCalculatorState {
  final String error;
  InputCalculatorStateError({required this.error});
  @override
  List<Object?> get props => [error];
}
