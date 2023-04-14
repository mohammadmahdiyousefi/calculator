import 'package:calculator/bloc/time/time_event.dart';
import 'package:calculator/bloc/time/time_state.dart';
import 'package:calculator/service/local/time_local_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/capabilities.dart';

class TimeBloc extends Bloc<ITimeEvent, ITimeState> {
//-----amount is used to hold the input value-----------------------------------
  String amount = '0';
//------result is used to store the answer--------------------------------------
  double result = 0;
//------The item is used to keep the unit---------------------------------------
  Capabilities item = TimeApi().getdata()[0];
  Capabilities item1 = TimeApi().getdata()[0];
  TimeBloc(super.initialState) {
//----------AreaEvent-----------------------------------------------------------
    on<TimeEvent>((event, emit) {
//----------Clear all-----------------------------------------------------------

      if (event.value == 'AC') {
        result = 0;
        amount = '0';
        emit(TimeState(amount, item, item1, result));
      }

//-------Clear each one---------------------------------------------------------

      else if (event.value == 'CE') {
        amount = amount.substring(0, amount.length - 1);
        if (amount.isEmpty) {
          amount = '0';
        } else {}
        claculateresult();
        emit(TimeState(amount, item, item1, result));
      }

//--------Change button---------------------------------------------------------

      else if (event.value == '⇌') {
        Capabilities item2 = item;
        item = item1;
        item1 = item2;
        claculateresult();
        emit(TimeState(amount, item, item1, result));
      }

//--------point conditions------------------------------------------------------

      else if (event.value == '.') {
        if (amount.contains(event.value) == false) {
          amount = amount + event.value;
        } else {}

        claculateresult();
        emit(TimeState(amount, item, item1, result));
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
        emit(TimeState(amount, item, item1, result));
      }
//------------------------------------------------------------------------------
    });
//----------ItemEvent-----------------------------------------------------------
    on<ItemEvent>((event, emit) {
      item = event.item;
      claculateresult();
      emit(TimeState(amount, item, item1, result));
    });
//----------Item1Event----------------------------------------------------------
    on<Item1Event>((event, emit) {
      item1 = event.item1;
      claculateresult();
      emit(TimeState(amount, item, item1, result));
    });
  }

//--------Calculation function--------------------------------------------------
  claculateresult() {
    if (amount != '') {
      result = (double.parse(amount) * item1.amount) / item.amount;
      result = result.round().toDouble();
    }
    return result;
  }
//------------------------------------------------------------------------------
}
