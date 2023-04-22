import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_event.dart';
import 'bmi_state.dart';

class BmiBloc extends Bloc<IBmiEvent, IBmiState> {
  Color resultcolor = Colors.grey.shade600;
//------result is used to store the answer--------------------------------------
  double result = 0;
  String height = '';
  String weight = '';
  BmiBloc(super.initialState) {
//----------HeightEvent---------------------------------------------------------
    on<HeightEvent>((event, emit) {
//----------Clear all-----------------------------------------------------------

      if (event.height == 'AC') {
        result = 0;
        height = '';
        emit(BmiState(resultcolor, height, weight, result));
      }
//-------Clear each one---------------------------------------------------------

      else if (event.height == 'CE') {
        resultcolor = Colors.transparent;
        result = 0;
        height = height.substring(0, height.length - 1);
        if (height.isEmpty) {
          height = '';
        } else {}

        emit(BmiState(resultcolor, height, weight, result));
      }
//--------point conditions------------------------------------------------------
      else if (event.height == '.') {
        if (height.contains(event.height) == false && height.length < 3) {
          height = height + event.height;
        } else {}

        emit(BmiState(resultcolor, height, weight, result));
      }
//--------Change button---------------------------------------------------------

      else if (event.height == '=') {
        claculateresult();
        emit(BmiState(resultcolor, height, weight, result));
      } else if (height.contains('.') == false && height.length < 3) {
        height = height + event.height;

        emit(BmiState(resultcolor, height, weight, result));
      } else if (height.contains('.') == true && height.length < 4) {
        height = height + event.height;

        emit(BmiState(resultcolor, height, weight, result));
      }
    });
//----------WeightEvent---------------------------------------------------------
    on<WeightEvent>((event, emit) {
//----------Clear all-----------------------------------------------------------

      if (event.weight == 'AC') {
        result = 0;
        weight = '';
        emit(BmiState(resultcolor, height, weight, result));
      }
//-------Clear each one---------------------------------------------------------

      else if (event.weight == 'CE') {
        resultcolor = Colors.grey.shade600;
        result = 0;
        weight = weight.substring(0, weight.length - 1);
        if (weight.isEmpty) {
          weight = '';
        } else {}

        emit(BmiState(resultcolor, height, weight, result));
      }
//--------point conditions------------------------------------------------------
      else if (event.weight == '.' && weight.length < 3) {
        if (weight.contains(event.weight) == false) {
          weight = weight + event.weight;
        } else {}

        emit(BmiState(resultcolor, height, weight, result));
      }
//--------Change button---------------------------------------------------------

      else if (event.weight == '=') {
        claculateresult();
        emit(BmiState(resultcolor, height, weight, result));
      } else if (weight.contains('.') == false && weight.length < 3) {
        weight = weight + event.weight;

        emit(BmiState(resultcolor, height, weight, result));
      } else if (weight.contains('.') == true && weight.length < 4) {
        weight = weight + event.weight;

        emit(BmiState(resultcolor, height, weight, result));
      }
    });
  }

//--------Calculation function--------------------------------------------------
  claculateresult() {
    double w = double.parse(weight);
    double h = double.parse(height);
    if (height.isNotEmpty && weight.isNotEmpty) {
      result = double.parse((w / (h * h)).toStringAsFixed(2));

      if (result < 18.5) {
        resultcolor = Colors.blue.shade300;
      } else if (result >= 18.5 && (w / (h * h)) < 25) {
        resultcolor = Colors.green;
      } else if (result >= 25 && (w / (h * h)) < 30) {
        resultcolor = Colors.orange;
      } else if (result >= 30) {
        resultcolor = Colors.red;
        if (result > 50) {
          result = 50;
        } else {
          result = result;
        }
      }
    } else {}
  }
//------------------------------------------------------------------------------
}
