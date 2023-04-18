import 'package:calculator/service/local/Storage_local_api.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/capabilities.dart';
import 'Storage_event.dart';
import 'Storage_state.dart';

class StorageBloc extends Bloc<IStorageEvent, IStorageState> {
//-----amount is used to hold the input value-----------------------------------
  TextEditingController amount = TextEditingController(text: '0');
//------result is used to store the answer--------------------------------------
  TextEditingController result = TextEditingController(text: '0');
//------The item is used to keep the unit---------------------------------------
  Capabilities item = StorageApi().getdata()[0];
  Capabilities item1 = StorageApi().getdata()[0];
  StorageBloc(super.initialState) {
//----------AreaEvent-----------------------------------------------------------
    on<StorageEvent>((event, emit) {
//----------Clear all-----------------------------------------------------------

      if (event.value == 'AC') {
        result.text = '0';
        amount.text = '0';
        emit(StorageState(amount, item, item1, result));
      }

//-------Clear each one---------------------------------------------------------

      else if (event.value == 'CE') {
        amount.text = amount.text.substring(0, amount.text.length - 1);
        if (amount.text.isEmpty) {
          amount.text = '0';
        } else {}
        claculateresult();
        emit(StorageState(amount, item, item1, result));
      }

//--------Change button---------------------------------------------------------

      else if (event.value == '⇌') {
        Capabilities item2 = item;
        item = item1;
        item1 = item2;
        claculateresult();
        emit(StorageState(amount, item, item1, result));
      }

//--------point conditions------------------------------------------------------

      else if (event.value == '.') {
        if (amount.text.contains(event.value) == false) {
          amount.text = amount.text + event.value;
        } else {}

        claculateresult();
        emit(StorageState(amount, item, item1, result));
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
        emit(StorageState(amount, item, item1, result));
      }
//------------------------------------------------------------------------------
    });
//----------ItemEvent-----------------------------------------------------------
    on<ItemEvent>((event, emit) {
      item = event.item;
      claculateresult();
      emit(StorageState(amount, item, item1, result));
    });
//----------Item1Event----------------------------------------------------------
    on<Item1Event>((event, emit) {
      item1 = event.item1;
      claculateresult();
      emit(StorageState(amount, item, item1, result));
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
