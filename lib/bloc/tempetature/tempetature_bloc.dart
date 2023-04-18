import 'package:calculator/bloc/tempetature/tempetature_event.dart';
import 'package:calculator/bloc/tempetature/tempetature_state.dart';
import 'package:calculator/service/local/Tempetature_local)api.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/capabilities.dart';

class TempetatureBloc extends Bloc<ITempetatureEvent, ITempetatureState> {
//-----amount is used to hold the input value-----------------------------------
  TextEditingController amount = TextEditingController(text: '0');
//------result is used to store the answer--------------------------------------
  TextEditingController result = TextEditingController(text: '0');
//------The item is used to keep the unit---------------------------------------
  Capabilities item = TempetatureApi().getdata()[0];
  Capabilities item1 = TempetatureApi().getdata()[0];
  TempetatureBloc(super.initialState) {
//----------AreaEvent-----------------------------------------------------------
    on<TempetatureEvent>((event, emit) {
//----------Clear all-----------------------------------------------------------

      if (event.value == 'AC') {
        result.text = '0';
        amount.text = '0';
        emit(TempetatureState(amount, item, item1, result));
      }

//-------Clear each one---------------------------------------------------------

      else if (event.value == 'CE') {
        amount.text = amount.text.substring(0, amount.text.length - 1);
        if (amount.text.isEmpty) {
          amount.text = '0';
        } else {}
        claculateresult();
        emit(TempetatureState(amount, item, item1, result));
      }

//--------Change button---------------------------------------------------------

      else if (event.value == '⇌') {
        Capabilities item2 = item;
        item = item1;
        item1 = item2;
        claculateresult();
        emit(TempetatureState(amount, item, item1, result));
      }

//--------point conditions------------------------------------------------------

      else if (event.value == '.') {
        if (amount.text.contains(event.value) == false) {
          amount.text = amount.text + event.value;
        } else {}

        claculateresult();
        emit(TempetatureState(amount, item, item1, result));
      }

//---------Add number-----------------------------------------------------------

      else {
        if (amount.text == '0') {
          amount.text = '';
          amount.text = amount.text + event.value;
        } else {
          amount.text = amount.text + event.value;
        }
        claculateresult();
        emit(TempetatureState(amount, item, item1, result));
      }
//------------------------------------------------------------------------------
    });
//----------ItemEvent-----------------------------------------------------------
    on<ItemEvent>((event, emit) {
      item = event.item;
      claculateresult();
      emit(TempetatureState(amount, item, item1, result));
    });
//----------Item1Event----------------------------------------------------------
    on<Item1Event>((event, emit) {
      item1 = event.item1;
      claculateresult();
      emit(TempetatureState(amount, item, item1, result));
    });
  }

//--------Calculation function--------------------------------------------------
  claculateresult() {
    if (amount.text != '') {
      if (item.parameter == item1.parameter) {
        result.text = (double.parse(amount.text)).toString();
      } else if (item.parameter == 'Celsius' &&
          item1.parameter == 'Fahrenheit') {
        result.text = ((double.parse(amount.text) * 9 / 5) + 32).toString();
      } else if (item.parameter == 'Celsius' && item1.parameter == 'Kelvin') {
        result.text = ((double.parse(amount.text) + 273.15)).toString();
      } else if (item.parameter == 'Fahrenheit' &&
          item1.parameter == 'Celsius') {
        result.text = ((double.parse(amount.text) - 32) * 5 / 9).toString();
      } else if (item.parameter == 'Fahrenheit' &&
          item1.parameter == 'Kelvin') {
        result.text = ((double.parse(amount.text) + 459.67) * 5 / 9).toString();
      } else if (item.parameter == 'Kelvin' && item1.parameter == 'Celsius') {
        result.text = ((double.parse(amount.text) - 273.15)).toString();
      } else if (item.parameter == 'Kelvin' &&
          item1.parameter == 'Fahrenheit') {
        result.text = ((double.parse(amount.text) * 9 / 5) - 459.67).toString();
      }
    }
    return result;
  }
//------------------------------------------------------------------------------
}
