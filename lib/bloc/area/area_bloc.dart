import 'package:calculator/service/local/area_local_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/capabilities.dart';
import 'area_event.dart';
import 'area_state.dart';

class AreaBloc extends Bloc<IAreaEvent, IAreaState> {
//-----amount is used to hold the input value-----------------------------------
  TextEditingController amount = TextEditingController(text: '0');
//------result is used to store the answer--------------------------------------
  TextEditingController result = TextEditingController(text: '0');
//------The item is used to keep the unit---------------------------------------
  Capabilities item = AreaApi().getdata()[0];
  Capabilities item1 = AreaApi().getdata()[0];
  AreaBloc(super.initialState) {
//----------AreaEvent-----------------------------------------------------------
    on<AreaEvent>((event, emit) {
//----------Clear all-----------------------------------------------------------

      if (event.value == 'AC') {
        amount.text = '0';

        claculateresult();
        emit(AreaState(amount, item, item1, result));
      }

//-------Clear each one---------------------------------------------------------

      else if (event.value == 'CE') {
        amount.text = amount.text.substring(0, amount.text.length - 1);
        if (amount.text.isEmpty) {
          amount.text = '0';
        } else {}
        claculateresult();
        emit(AreaState(amount, item, item1, result));
      }

//--------Change button---------------------------------------------------------

      else if (event.value == '⇌') {
        Capabilities item2 = item;
        item = item1;
        item1 = item2;
        claculateresult();
        emit(AreaState(amount, item, item1, result));
      }

//--------point conditions------------------------------------------------------

      else if (event.value == '.') {
        if (amount.text.contains(event.value) == false) {
          amount.text = amount.text + event.value;
        } else {
          amount.text = amount.text;
        }

        claculateresult();
        emit(AreaState(amount, item, item1, result));
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
        emit(AreaState(amount, item, item1, result));
      }
//------------------------------------------------------------------------------
    });
//----------ItemEvent-----------------------------------------------------------
    on<ItemEvent>((event, emit) {
      item = event.item;
      claculateresult();
      emit(AreaState(amount, item, item1, result));
    });
//----------Item1Event----------------------------------------------------------
    on<Item1Event>((event, emit) {
      item1 = event.item1;
      claculateresult();
      emit(AreaState(amount, item, item1, result));
    });
  }

//--------Calculation function--------------------------------------------------
  claculateresult() {
    if (amount.text != '') {
      result.text =
          ((double.parse(amount.text) * item1.amount) / item.amount).toString();
    }
    return result;
  }
//------------------------------------------------------------------------------
}
