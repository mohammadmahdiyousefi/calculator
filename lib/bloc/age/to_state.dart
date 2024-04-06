import 'package:equatable/equatable.dart';

abstract class ToState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToStateInit extends ToState {}

class ToStateLoading extends ToState {}

class ToStateSeted extends ToState {
  final DateTime to;
  ToStateSeted({required this.to});

  @override
  List<Object?> get props => [to];
}

class ToStateError extends ToState {
  final DateTime error;
  ToStateError({required this.error});

  @override
  List<Object?> get props => [error];
}
