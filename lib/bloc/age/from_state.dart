import 'package:equatable/equatable.dart';

abstract class FromState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FromStateInit extends FromState {}

class FromStateLoading extends FromState {}

class FromStateSeted extends FromState {
  final DateTime from;
  FromStateSeted({required this.from});

  @override
  List<Object?> get props => [from];
}

class FromStateError extends FromState {
  final DateTime error;
  FromStateError({required this.error});

  @override
  List<Object?> get props => [error];
}
