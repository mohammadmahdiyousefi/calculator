import 'package:calculator/bloc/tempetature/tempetature_event.dart';
import 'package:calculator/bloc/tempetature/tempetature_state.dart';
import 'package:calculator/service/local/Tempetature_local)api.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/capabilities.dart';

class TempetatureBloc extends Bloc<ITempetatureEvent, ITempetatureState> {
//-----amount is used to hold the input value-----------------------------------
  String amount = '0';
//------result is used to store the answer--------------------------------------
  double result = 0;
//------The item is used to keep the unit---------------------------------------
  Capabilities item = TempetatureApi().getdata()[0];
  Capabilities item1 = TempetatureApi().getdata()[0];
  TempetatureBloc(super.initialState) {
//----------AreaEvent-----------------------------------------------------------
    on<TempetatureEvent>((event, emit) {
//----------Clear all-----------------------------------------------------------

      if (event.value == 'AC') {
        result = 0;
        amount = '0';
        emit(TempetatureState(amount, item, item1, result));
      }

//-------Clear each one---------------------------------------------------------

      else if (event.value == 'CE') {
        amount = amount.substring(0, amount.length - 1);
        if (amount.isEmpty) {
          amount = '0';
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
        if (amount.contains(event.value) == false) {
          amount = amount + event.value;
        } else {}

        claculateresult();
        emit(TempetatureState(amount, item, item1, result));
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
    if (amount != '') {
      if (item.parameter == item1.parameter) {
        result = double.parse(amount);
      } else if (item.parameter == 'Celsius' &&
          item1.parameter == 'Fahrenheit') {
        result = (double.parse(amount) * 9 / 5) + 32;
      } else if (item.parameter == 'Celsius' && item1.parameter == 'Kelvin') {
        result = (double.parse(amount) + 273.15);
      } else if (item.parameter == 'Fahrenheit' &&
          item1.parameter == 'Celsius') {
        result = (double.parse(amount) - 32) * 5 / 9;
      } else if (item.parameter == 'Fahrenheit' &&
          item1.parameter == 'Kelvin') {
        result = (double.parse(amount) + 459.67) * 5 / 9;
      } else if (item.parameter == 'Kelvin' && item1.parameter == 'Celsius') {
        result = (double.parse(amount) - 273.15);
      } else if (item.parameter == 'Kelvin' &&
          item1.parameter == 'Fahrenheit') {
        result = (double.parse(amount) * 9 / 5) - 459.67;
      }
    }
    return result;
  }
//------------------------------------------------------------------------------
}
