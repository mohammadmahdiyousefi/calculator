import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BmiState extends Equatable {
  @override
  List<Object> get props => [];
}

class BmiInitState extends BmiState {}

class BmiLoadingState extends BmiState {}

class BmiResultState extends BmiState {
  final Color color;
  final double result;
  final String bodystatus;
  BmiResultState(this.color, this.result, this.bodystatus);
  @override
  List<Object> get props => [color, result, bodystatus];
}

class BmiErrorState extends BmiState {
  final String error;
  BmiErrorState(this.error);
  @override
  List<Object> get props => [error];
}
