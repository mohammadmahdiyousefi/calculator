import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calculator/bloc/calculator/input_calculator.dart';
import 'package:calculator/bloc/calculator/result_calculator.dart';
import 'package:math_expressions/math_expressions.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<ICalculatorEvent, CalculatorState> {
  String inputuser = "0";
  String result = "";
  StreamSubscription<int>? _tickerSubscription;

  CalculatorBloc()
      : super(CalculatorState(
            result: ResultCalculatorStateInital(),
            input: InputCalculatorStateInital())) {
    on<CalculatorEventInitial>((event, emit) => _calculatorInit(emit));
    on<CalculatorAC>((event, emit) => _acfunction(emit));
    on<CalculatorCE>((event, emit) => _cefunction(emit));
    on<CalculatorCETimer>((event, emit) => _startCETimer(emit));
    on<CalculatorCETimerCancel>((event, emit) => _cancelCETimer(emit));
    on<CalculatorEqual>((event, emit) => _equalfunction(emit));
    on<CalculatorEvent>((event, emit) => _onInputEvent(event, emit));
  }
  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _calculatorInit(Emitter<CalculatorState> emit) {
    emit(state.copyWith(
        newinput: InputCalculatorStateUser(input: inputuser),
        newresult: ResultCalculatorStateResult(resultCalculator: result)));
  }

  void _onInputEvent(CalculatorEvent event, Emitter<CalculatorState> emit) {
    if (event.value == 'x^' && inputuser.isNotEmpty) {
      inputuser = '$inputuser^';
      result = '';
    } else {
      inputuser = inputuser == '0' ? event.value : inputuser + event.value;
      result = '';
    }
    emit(state.copyWith(
      newinput: InputCalculatorStateUser(input: inputuser),
      newresult: ResultCalculatorStateResult(resultCalculator: result),
    ));
  }

  void _equalfunction(Emitter<CalculatorState> emit) {
    if (result.isEmpty) {
      try {
        final Parser parser = Parser();
        final ContextModel contextModel = ContextModel();
        inputuser = inputuser.replaceAll('×', '*');
        inputuser = inputuser.replaceAll('÷', '/');
        final Expression expression = parser.parse(inputuser);
        final double evaluateResult =
            expression.evaluate(EvaluationType.REAL, contextModel);
        result = evaluateResult.toString();
        if (result.endsWith('.0')) {
          result = result.replaceAll('.0', '');
        }
        inputuser = inputuser.replaceAll('*', '×');
        inputuser = inputuser.replaceAll('/', '÷');
        emit(state.copyWith(
            newinput: InputCalculatorStateUser(input: inputuser),
            newresult:
                ResultCalculatorStateResult(resultCalculator: '=$result')));
      } catch (ex) {
        inputuser = inputuser.replaceAll('*', '×');
        inputuser = inputuser.replaceAll('/', '÷');
        emit(state.copyWith(
            newinput: InputCalculatorStateUser(input: inputuser),
            newresult: ResultCalculatorStateError(error: ex.toString())));
      }
    } else {
      inputuser = result;
      result = '';
      emit(state.copyWith(
          newinput: InputCalculatorStateUser(input: inputuser),
          newresult: ResultCalculatorStateResult(resultCalculator: result)));
    }
  }

  void _cefunction(Emitter<CalculatorState> emit) {
    if (inputuser.isNotEmpty && inputuser != '0' && inputuser.length > 1) {
      inputuser = inputuser.substring(0, inputuser.length - 1);
    } else {
      inputuser = '0';
    }
    result = '';
    emit(state.copyWith(
        newinput: InputCalculatorStateUser(input: inputuser),
        newresult: ResultCalculatorStateResult(resultCalculator: result)));
  }

  void _cancelCETimer(Emitter<CalculatorState> emit) {
    _tickerSubscription?.cancel();
    emit(state.copyWith(
        newinput: InputCalculatorStateUser(input: inputuser),
        newresult: ResultCalculatorStateResult(resultCalculator: result)));
  }

  void _startCETimer(Emitter<CalculatorState> emit) {
    _tickerSubscription =
        Stream<int>.periodic(const Duration(milliseconds: 100), (x) => x)
            .take(inputuser.length)
            .listen((event) {
      if (inputuser == '0') {
        _tickerSubscription?.cancel();
      } else {
        add(CalculatorCE());
      }
    });
  }

  void _acfunction(Emitter<CalculatorState> emit) {
    inputuser = '0';
    result = '';
    emit(state.copyWith(
        newinput: InputCalculatorStateUser(input: inputuser),
        newresult: ResultCalculatorStateResult(resultCalculator: result)));
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
