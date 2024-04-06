import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_event.dart';
import 'bmi_state.dart';

class BmiBloc extends Bloc<IBmiEvent, BmiState> {
  Color resultcolor = Colors.grey.shade600;
  double? result;
  String status = "normal";
  BmiBloc() : super(BmiInitState()) {
    on<BMICalculateEvent>((event, emit) {
      emit(BmiLoadingState());
      result = double.tryParse(
          ((event.weight / (event.height * event.height)) * 10000)
              .toStringAsFixed(2));
      if (result == null) {
        emit(BmiErrorState("Invalid Input"));
      } else {
        claculateresult(result!);
        emit(BmiResultState(resultcolor, result!, status));
      }
    });
  }
  void claculateresult(double result) {
    if (result < 18.5) {
      resultcolor = Colors.blue.shade300;
      status = "underweight";
    } else if (result >= 18.5 && result < 25) {
      resultcolor = Colors.green;
      status = "normal";
    } else if (result >= 25 && result < 30) {
      resultcolor = Colors.redAccent;
      status = "overweight";
    } else if (result >= 30) {
      resultcolor = Colors.red;
      status = "obese";
    } else {}
  }
}
