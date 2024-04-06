import 'package:bloc/bloc.dart';
import 'package:calculator/bloc/calculator/input_calculator.dart';
import 'package:calculator/bloc/calculator/result_calculator.dart';
import 'package:math_expressions/math_expressions.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<ICalculatorEvent, CalculatorState> {
  String inputuser = "0";
  String result = "";
  CalculatorBloc()
      : super(CalculatorState(
            result: ResultCalculatorStateInital(),
            input: InputCalculatorStateInital())) {
    on<CalculatorEventInitial>((event, emit) {
      emit(state.copyWith(
          newinput: InputCalculatorStateUser(input: inputuser),
          newresult: ResultCalculatorStateResult(resultCalculator: result)));
    });
    on<CalculatorEvent>(
      (event, emit) {
        if (event.value == 'CE') {
          inputuser = inputuser.substring(0, inputuser.length - 1);
          if (inputuser.isEmpty) {
            inputuser = '0';
          }
          result = '';
          emit(state.copyWith(
              newinput: InputCalculatorStateUser(input: inputuser),
              newresult:
                  ResultCalculatorStateResult(resultCalculator: result)));
        } else if (event.value == 'AC') {
          inputuser = '0';
          result = '';
          emit(state.copyWith(
              newinput: InputCalculatorStateUser(input: inputuser),
              newresult:
                  ResultCalculatorStateResult(resultCalculator: result)));
        } else if (event.value == '=') {
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
                      ResultCalculatorStateResult(resultCalculator: result)));
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
                newresult:
                    ResultCalculatorStateResult(resultCalculator: result)));
          }
        } else if (event.value == 'x^' && inputuser != '') {
          inputuser = '$inputuser^';
          result = '';
          emit(state.copyWith(
              newinput: InputCalculatorStateUser(input: inputuser),
              newresult:
                  ResultCalculatorStateResult(resultCalculator: result)));
        } else {
          result = '';
          if (inputuser == '0') {
            inputuser = event.value;
          } else {
            inputuser = inputuser + event.value;
          }
          emit(state.copyWith(
              newinput: InputCalculatorStateUser(input: inputuser),
              newresult:
                  ResultCalculatorStateResult(resultCalculator: result)));
        }
//------------------------------------------------------------------------------
      },
    );
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
