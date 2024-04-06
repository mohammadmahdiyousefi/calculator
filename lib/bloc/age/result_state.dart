import 'package:age_calculator/age_calculator.dart';
import 'package:equatable/equatable.dart';

abstract class ResultState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResultStateInit extends ResultState {}

class ResultStateLoading extends ResultState {}

class ResultStateCompleted extends ResultState {
  final DateDuration age;
  final DateDuration nextbirthday;
  final DateDuration diffrence;
  final Duration summary;
  ResultStateCompleted(
      {required this.age,
      required this.nextbirthday,
      required this.diffrence,
      required this.summary});

  @override
  List<Object?> get props => [age, nextbirthday, diffrence, summary];
}

class ResultStateError extends ResultState {
  final DateTime error;
  ResultStateError({required this.error});

  @override
  List<Object?> get props => [error];
}
