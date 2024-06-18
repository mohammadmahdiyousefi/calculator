import 'dart:async';

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
  String inputuser = "0";
  double? result = 0;
  Capabilities? from;
  Capabilities? to;
  String? titel;
  StreamSubscription<int>? _tickerSubscription;

  UnitconversionBloc()
      : super(UnitconversionState(
            from: FromStateInital(),
            to: ToStateInital(),
            result: ResultStateInital(),
            input: InputStateInital())) {
    on<UnitconversionInitial>((event, emit) {
      initFunction(event, emit);
    });
    on<UnitconversionAC>((event, emit) => _acCondition(emit));
    on<UnitconversionCETimer>((event, emit) => _startCETimer(emit));
    on<UnitconversionCETimerCancel>((event, emit) => _cancelCETimer(emit));
    on<UnitconversionCE>((event, emit) => _ceCondition(emit));
    on<UnitconversionChange>((event, emit) => _changeCondition(emit));
    on<Unitconversion>((event, emit) {
      switch (event.input) {
        case '.':
          _decimalCondition(event, emit);
          break;
        default:
          _updateInputUser(event, emit);
          break;
      }
    });
    on<FromUnit>((event, emit) => _setFromUnit(event, emit));
    on<ToUnit>((event, emit) => _setToUnit(event, emit));
  }

  void initFunction(
      UnitconversionInitial event, Emitter<UnitconversionState> emit) {
    from = event.from;
    to = event.to;
    emit(state.copyWith(
        newfrom: FromStateUnit(unit: from!), newto: ToStateUnit(unit: to!)));
    if (from != null && to != null) {
      result = unitConvert(inputuser, from, to);
      emit(state.copyWith(
        newresult: ResultStateResult(result: finalresult(result)),
        newinput: InputStateUser(input: finalinput(inputuser)),
      ));
    }
  }

  void _setToUnit(ToUnit event, Emitter<UnitconversionState> emit) {
    to = event.to;
    emit(state.copyWith(newto: ToStateUnit(unit: to!)));
    if (from != null && to != null) {
      result = unitConvert(inputuser, from, to);

      emit(state.copyWith(
          newresult: ResultStateResult(result: finalresult(result)),
          newfrom: FromStateUnit(unit: from!)));
    }
  }

  void _setFromUnit(FromUnit event, Emitter<UnitconversionState> emit) {
    from = event.from;
    emit(state.copyWith(newfrom: FromStateUnit(unit: from!)));
    if (from != null && to != null) {
      result = unitConvert(inputuser, from, to);
      emit(state.copyWith(
          newresult: ResultStateResult(result: finalresult(result)),
          newfrom: FromStateUnit(unit: from!)));
    }
  }

  void _acCondition(Emitter<UnitconversionState> emit) {
    inputuser = '0';
    result = unitConvert(inputuser, from, to);
    emit(state.copyWith(
      newinput: InputStateUser(input: finalinput(inputuser)),
      newresult: ResultStateResult(result: finalresult(result)),
    ));
  }

  void _ceCondition(Emitter<UnitconversionState> emit) {
    inputuser = inputuser.substring(0, inputuser.length - 1);
    if (inputuser.isEmpty) {
      inputuser = '0';
    }
    result = unitConvert(inputuser, from, to);
    emit(state.copyWith(
      newinput: InputStateUser(input: finalinput(inputuser)),
      newresult: ResultStateResult(result: finalresult(result)),
    ));
  }

  void _cancelCETimer(Emitter<UnitconversionState> emit) {
    _tickerSubscription?.cancel();
    emit(state.copyWith(
      newinput: InputStateUser(input: finalinput(inputuser)),
      newresult: ResultStateResult(result: finalresult(result)),
    ));
  }

  void _startCETimer(Emitter<UnitconversionState> emit) {
    _tickerSubscription =
        Stream<int>.periodic(const Duration(milliseconds: 100), (x) => x)
            .take(inputuser.length)
            .listen((event) {
      if (inputuser == '0') {
        _tickerSubscription?.cancel();
      } else {
        add(UnitconversionCE());
      }
    });
  }

  void _changeCondition(Emitter<UnitconversionState> emit) {
    if (from != null && to != null) {
      final Capabilities? change = from;
      from = to;
      to = change;
      result = unitConvert(inputuser, from, to);
      emit(state.copyWith(
          newinput: InputStateUser(input: finalinput(inputuser)),
          newresult: ResultStateResult(result: finalresult(result)),
          newfrom: FromStateUnit(unit: from!),
          newto: ToStateUnit(unit: to!)));
    }
  }

  void _decimalCondition(
      Unitconversion event, Emitter<UnitconversionState> emit) {
    if (inputuser.length < 18 && !inputuser.contains(event.input)) {
      inputuser = inputuser + event.input;

      result = unitConvert(inputuser, from, to);
      emit(state.copyWith(
        newinput: InputStateUser(input: finalinput(inputuser)),
        newresult: ResultStateResult(result: finalresult(result)),
      ));
    }
  }

  void _updateInputUser(
      Unitconversion event, Emitter<UnitconversionState> emit) {
    if (inputuser == '0') {
      inputuser = '';
    }

    int totalLength = inputuser.length;

    if (inputuser.contains('.')) {
      totalLength -= 1; // برای نقطه اعشار
    }

    if (totalLength < 18) {
      inputuser = inputuser + event.input;
    }

    result = unitConvert(inputuser, from, to);
    emit(state.copyWith(
      newinput: InputStateUser(input: finalinput(inputuser)),
      newresult: ResultStateResult(result: finalresult(result)),
    ));
  }

  double? unitConvert(String inputuser, dynamic from, dynamic to) {
    if (from == null || to == null) {
      return double.tryParse(inputuser) ?? 0;
    } else {
      final double input = double.tryParse(inputuser) ?? 0;
      return input.convertFromTo(from!.unit, to!.unit);
    }
  }

  String finalinput(String? input) {
    if (input == null) {
      return "0";
    } else {
      if (input.contains('.')) {
        return "${separateByComma(int.parse(input.split(".")[0]))}.${input.split(".")[1]}";
      } else {
        return separateByComma(int.parse(input));
      }
    }
  }

  String finalresult(double? input) {
    if (input == null) {
      return "0";
    } else {
      return "${separateByComma(int.parse(input.toString().split(".")[0]))}.${input.toString().split(".")[1]}";
    }
  }

  String separateByComma(int input) {
    if (input < 1000) {
      return input.toString();
    }
    String s = separateByComma(input ~/ 1000);
    String r = (input % 1000).toString();
    if (r.length == 1) {
      r = "00$r";
    } else if (r.length == 2) {
      r = "0$r";
    }
    return "$s,$r";
  }
}
