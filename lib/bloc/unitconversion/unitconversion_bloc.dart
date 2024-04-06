import 'package:calculator/bloc/unitconversion/from_state.dart';
import 'package:calculator/bloc/unitconversion/input_state.dart';
import 'package:calculator/bloc/unitconversion/result_state.dart';
import 'package:calculator/bloc/unitconversion/to_state.dart';
import 'package:calculator/bloc/unitconversion/unitconversion_event.dart';
import 'package:calculator/bloc/unitconversion/unitconversion_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:units_converter/models/extension_converter.dart';
import '../../model/capabilities.dart';

class UnitconversionBloc
    extends Bloc<IUnitconversionEvent, UnitconversionState> {
  //-----inputuser is used to hold the input value-----------------------------------
  String inputuser = "0";
//------result is used to store the answer--------------------------------------
  double? result = 0;

//------The unit is used to keep the unit---------------------------------------
  Capabilities? from;
  Capabilities? to;
  String? titel;

  UnitconversionBloc()
      : super(UnitconversionState(
            from: FromStateInital(),
            to: ToStateInital(),
            result: ResultStateInital(),
            input: InputStateInital())) {
    on<UnitconversionInitial>((event, emit) {
      from = event.from;
      to = event.to;
      emit(state.copyWith(
          newfrom: FromStateUnit(unit: from!), newto: ToStateUnit(unit: to!)));
      if (from != null && to != null) {
        result = unitConvert(inputuser, from, to);
        emit(state.copyWith(
          newresult: ResultStateResult(result: result ?? 0),
          newinput: InputStateUser(input: inputuser),
        ));
      }
    });
    on<Unitconversion>((event, emit) {
      if (event.input == 'AC') {
        inputuser = '0';
        result = unitConvert(inputuser, from, to);
        emit(state.copyWith(
          newinput: InputStateUser(input: inputuser),
          newresult: ResultStateResult(result: result ?? 0),
        ));
      }

//-------Clear each one---------------------------------------------------------

      else if (event.input == 'CE') {
        inputuser = inputuser.substring(0, inputuser.length - 1);
        if (inputuser.isEmpty) {
          inputuser = '0';
        }
        result = unitConvert(inputuser, from, to);
        emit(state.copyWith(
          newinput: InputStateUser(input: inputuser),
          newresult: ResultStateResult(result: result ?? 0),
        ));
      }

//--------Change button---------------------------------------------------------

      else if (event.input == '⇌') {
        if (from != null && to != null) {
          final Capabilities? change = from;
          from = to;
          to = change;
          result = unitConvert(inputuser, from, to);
          emit(state.copyWith(
              newinput: InputStateUser(input: inputuser),
              newresult: ResultStateResult(result: result ?? 0),
              newfrom: FromStateUnit(unit: from!),
              newto: ToStateUnit(unit: to!)));
        }
      }

//--------point conditions------------------------------------------------------

      else if (event.input == '.') {
        if (inputuser.contains(event.input)) {
          inputuser = inputuser;
        } else {
          inputuser = inputuser + event.input;
        }

        result = unitConvert(inputuser, from, to);
        emit(state.copyWith(
          newinput: InputStateUser(input: inputuser),
          newresult: ResultStateResult(result: result ?? 0),
        ));
      }

//---------Add number-----------------------------------------------------------

      else {
        if (inputuser == '0') {
          inputuser = '';
          inputuser = inputuser + event.input;
        } else {
          inputuser = inputuser + event.input;
        }

        result = unitConvert(inputuser, from, to);
        emit(state.copyWith(
          newinput: InputStateUser(input: inputuser),
          newresult: ResultStateResult(result: result ?? 0),
        ));
      }
    });
    on<FromUnit>((event, emit) {
      from = event.from;
      emit(state.copyWith(newfrom: FromStateUnit(unit: from!)));
      if (from != null && to != null) {
        result = unitConvert(inputuser, from, to);
        emit(state.copyWith(
            newresult: ResultStateResult(result: result ?? 0),
            newfrom: FromStateUnit(unit: from!)));
      }
    });
    on<ToUnit>((event, emit) {
      to = event.to;
      emit(state.copyWith(newto: ToStateUnit(unit: to!)));
      if (from != null && to != null) {
        result = unitConvert(inputuser, from, to);
        emit(state.copyWith(
            newresult: ResultStateResult(result: result ?? 0),
            newfrom: FromStateUnit(unit: from!)));
      }
    });
  }

  double? unitConvert(String inputuser, dynamic from, dynamic to) {
    if (from == null || to == null) {
      return double.tryParse(inputuser) ?? 0;
    } else {
      final double input = double.tryParse(inputuser) ?? 0;
      return input.convertFromTo(from!.unit, to!.unit);
    }
  }
}
