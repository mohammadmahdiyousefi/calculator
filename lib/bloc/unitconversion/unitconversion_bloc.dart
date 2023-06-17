import 'package:calculator/bloc/unitconversion/unitconversion_event.dart';
import 'package:calculator/bloc/unitconversion/unitconversion_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/capabilities.dart';

class UnitconversionBloc
    extends Bloc<IUnitconversionEvent, IUnitconversionState> {
  String inputuser = "0";
  //-----amount is used to hold the input value-----------------------------------
  String amount = "0";
//------result is used to store the answer--------------------------------------
  String result = "0";
//------The unit is used to keep the unit---------------------------------------
  Capabilities? unit;
  Capabilities? unit1;
  String? titel;

  UnitconversionBloc(super.initialState) {
    on<Unitconversion>((event, emit) {
      if (event.value == 'AC') {
        amount = '0';
        claculateresult();
        emit(UnitconversionState(inputuser, unit!, unit1!, result));
      }

//-------Clear each one---------------------------------------------------------

      else if (event.value == 'CE') {
        amount = amount.substring(0, amount.length - 1);

        if (amount.isEmpty) {
          amount = '0';
        } else {}
        claculateresult();
        emit(UnitconversionState(inputuser, unit!, unit1!, result));
      }

//--------Change button---------------------------------------------------------

      else if (event.value == '⇌') {
        Capabilities unit2 = unit!;
        unit = unit1!;
        unit1 = unit2;
        claculateresult();
        emit(UnitconversionState(inputuser, unit!, unit1!, result));
      }

//--------point conditions------------------------------------------------------

      else if (event.value == '.') {
        if (amount.contains(event.value) == false) {
          amount = amount + event.value;
        } else {
          amount = amount;
        }

        claculateresult();
        emit(UnitconversionState(inputuser, unit!, unit1!, result));
      }

//---------Add number-----------------------------------------------------------

      else {
        if (amount == '0') {
          amount = '';
          amount = amount + event.value;
        } else {
          amount = amount + event.value;
        }

        claculateresult();
        emit(UnitconversionState(inputuser, unit!, unit1!, result));
      }
    });
    on<Unit>((event, emit) {
      unit = event.unit;
      claculateresult();
      emit(UnitconversionState(inputuser, unit!, unit1!, result));
    });
    on<Unit1>((event, emit) {
      unit1 = event.unit1;
      claculateresult();
      emit(UnitconversionState(inputuser, unit!, unit1!, result));
    });
    on<Settitel>((event, emit) {
      titel = event.titel;
    });
  }
  claculateresult() {
    if (titel == 'Temperature') {
      if (amount != '') {
        if (unit!.parameter == unit1!.parameter) {
          result = (double.parse(amount)).toString();
        } else if (unit!.parameter == 'Celsius' &&
            unit1!.parameter == 'Fahrenheit') {
          result = ((double.parse(amount) * 9 / 5) + 32).toString();
        } else if (unit!.parameter == 'Celsius' &&
            unit1!.parameter == 'Kelvin') {
          result = ((double.parse(amount) + 273.15)).toString();
        } else if (unit!.parameter == 'Fahrenheit' &&
            unit1!.parameter == 'Celsius') {
          result = ((double.parse(amount) - 32) * 5 / 9).toString();
        } else if (unit!.parameter == 'Fahrenheit' &&
            unit1!.parameter == 'Kelvin') {
          result = ((double.parse(amount) + 459.67) * 5 / 9).toString();
        } else if (unit!.parameter == 'Kelvin' &&
            unit1!.parameter == 'Celsius') {
          result = ((double.parse(amount) - 273.15)).toString();
        } else if (unit!.parameter == 'Kelvin' &&
            unit1!.parameter == 'Fahrenheit') {
          result = ((double.parse(amount) * 9 / 5) - 459.67).toString();
        }
      }
    } else if (titel == 'Time') {
      if (amount != '') {
        result = ((double.parse(amount) * unit1!.amount) / unit!.amount)
            .roundToDouble()
            .toString();
      }
    } else {
      if (amount != '') {
        result =
            ((double.parse(amount) * unit1!.amount) / unit!.amount).toString();
      }
    }
    result = separateByComma(double.parse(result).toInt()) +
        result.substring(result.lastIndexOf('.'));
    inputuser = amount;
    if (inputuser.contains('.')) {
      inputuser = separateByComma(double.parse(inputuser).toInt()) +
          inputuser.substring(inputuser.lastIndexOf('.'));
    } else {
      inputuser = separateByComma(double.parse(inputuser).toInt());
    }
    return result;
  }

  String separateByComma(int n) {
    if (n < 1000) {
      return n.toString();
    }
    String s = separateByComma(n ~/ 1000);
    String r = (n % 1000).toString();
    if (r.length == 1) {
      r = "00$r";
    } else if (r.length == 2) {
      r = "0$r";
    }
    return "$s,$r";
  }
}
