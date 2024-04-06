import 'package:calculator/model/capabilities.dart';
import 'package:equatable/equatable.dart';

abstract class FromState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FromStateInital extends FromState {}

final class FromStateUnit extends FromState {
  final Capabilities unit;
  FromStateUnit({required this.unit});
  @override
  List<Object?> get props => [unit];
}
