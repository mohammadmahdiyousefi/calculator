import 'package:calculator/model/capabilities.dart';
import 'package:equatable/equatable.dart';

abstract class ToState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ToStateInital extends ToState {}

final class ToStateUnit extends ToState {
  final Capabilities unit;
  ToStateUnit({required this.unit});
  @override
  List<Object?> get props => [unit];
}
