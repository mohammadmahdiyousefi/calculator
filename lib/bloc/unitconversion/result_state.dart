import 'package:equatable/equatable.dart';

abstract class ResultState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ResultStateInital extends ResultState {}

final class ResultStateResult extends ResultState {
  final String result;
  ResultStateResult({required this.result});
  @override
  List<Object?> get props => [result];
}

final class ResultStateError extends ResultState {
  final String error;
  ResultStateError({required this.error});
  @override
  List<Object?> get props => [error];
}
