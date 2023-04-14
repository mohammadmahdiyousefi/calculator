import 'package:calculator/service/local/length_local_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/capabilities.dart';
import 'length_event.dart';
import 'length_state.dart';

class LengthBloc extends Bloc<ILengthEvent, ILengthState> {
//-----amount is used to hold the input value-----------------------------------
  String amount = '0';
//------result is used to store the answer--------------------------------------
  double result = 0;
//------The item is used to keep the unit---------------------------------------
  Capabilities item = LengthApi().getdata()[0];
  Capabilities item1 = LengthApi().getdata()[0];
  LengthBloc(super.initialState) {
//----------AreaEvent-----------------------------------------------------------
    on<LengthEvent>((event, emit) {
//----------Clear all-----------------------------------------------------------

      if (event.value == 'AC') {
        result = 0;
        amount = '0';
        emit(LengthState(amount, item, item1, result));
      }

//-------Clear each one---------------------------------------------------------

      else if (event.value == 'CE') {
        amount = amount.substring(0, amount.length - 1);
        if (amount.isEmpty) {
          amount = '0';
        } else {}
        claculateresult();
        emit(LengthState(amount, item, item1, result));
      }

//--------Change button---------------------------------------------------------

      else if (event.value == '⇌') {
        Capabilities item2 = item;
        item = item1;
        item1 = item2;
        claculateresult();
        emit(LengthState(amount, item, item1, result));
      }

//--------point conditions------------------------------------------------------

      else if (event.value == '.') {
        if (amount.contains(event.value) == false) {
          amount = amount + event.value;
        } else {}

        claculateresult();
        emit(LengthState(amount, item, item1, result));
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
        emit(LengthState(amount, item, item1, result));
      }
//------------------------------------------------------------------------------
    });
//----------ItemEvent-----------------------------------------------------------
    on<ItemEvent>((event, emit) {
      item = event.item;
      claculateresult();
      emit(LengthState(amount, item, item1, result));
    });
//----------Item1Event----------------------------------------------------------
    on<Item1Event>((event, emit) {
      item1 = event.item1;
      claculateresult();
      emit(LengthState(amount, item, item1, result));
    });
  }

//--------Calculation function--------------------------------------------------
  claculateresult() {
    if (amount != '') {
      result = (double.parse(amount) * item1.amount) / item.amount;
    }
    return result;
  }
//------------------------------------------------------------------------------
}
