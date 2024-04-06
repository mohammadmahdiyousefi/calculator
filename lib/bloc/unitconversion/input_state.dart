import 'package:equatable/equatable.dart';

abstract class InputState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class InputStateInital extends InputState {}

final class InputStateUser extends InputState {
  final String input;
  InputStateUser({required this.input});
  @override
  List<Object?> get props => [input];
}

final class InputStateError extends InputState {
  final String error;
  InputStateError({required this.error});
  @override
  List<Object?> get props => [error];
}
