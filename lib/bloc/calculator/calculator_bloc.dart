import 'package:bloc/bloc.dart';

import 'package:math_expressions/math_expressions.dart';

import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<ICalculatorEvent, ICalculatorState> {
  String inputuser = '0';
  String inputuserdtate = '0';
  String result = '';
  double resultvalue = 0;
  String operator = '';

  String value = '';
  CalculatorBloc(super.initialState) {
    on<CalculatorEvent>(
      (event, emit) {
        try {
//------------------------------------------------------------------------------
          //پاک کردن تک تک
          if (event.value == 'CE') {
            inputuser = inputuser.substring(0, inputuser.length - 1);
            if (inputuser.isEmpty) {
              inputuser = '0';
            } else {}
            result = '';
            emit(CalculatorState(result, inputuser));
          }

//------------------------------------------------------------------------------
          //پاک کردن کل
          else if (event.value == 'AC') {
            inputuser = '0';
            result = '';
            emit(CalculatorState(result, inputuser));
          }
//------------------------------------------------------------------------------
          //کلید مساوی
          else if (event.value == '=') {
            Parser parser = Parser();
            value = inputuser.replaceAll('×', '*');
            value = value.replaceAll('÷', '/');
            Expression expression = parser.parse(value);
            ContextModel contextModel = ContextModel();
            double result1 =
                expression.evaluate(EvaluationType.REAL, contextModel);
            result = result1.toStringAsFixed(3);
            resultvalue = result1;

            emit(CalculatorState(result, inputuser));
          }
//------------------------------------------------------------------------------

          else if (event.value == 'x²' && inputuser != '') {
            inputuser = '(${inputuser})^(2)';

            emit(CalculatorState(result, inputuser));
          }
//--------point conditions------------------------------------------------------
          else if (event.value == '.') {
            if (inputuser.contains(event.value) == false) {
              if (inputuser[inputuser.length - 1] != '0' &&
                  inputuser[inputuser.length - 1] != '1' &&
                  inputuser[inputuser.length - 1] != '2' &&
                  inputuser[inputuser.length - 1] != '3' &&
                  inputuser[inputuser.length - 1] != '4' &&
                  inputuser[inputuser.length - 1] != '5' &&
                  inputuser[inputuser.length - 1] != '6' &&
                  inputuser[inputuser.length - 1] != '7' &&
                  inputuser[inputuser.length - 1] != '8' &&
                  inputuser[inputuser.length - 1] != '9') {
                inputuser = inputuser + '0' + event.value;
              } else {
                inputuser = inputuser + event.value;
              }
            } else if (inputuser.contains(event.value) == true) {
              if ((inputuser.substring(
                          inputuser.lastIndexOf(operator), inputuser.length))
                      .contains(event.value) ==
                  false) {
                if (inputuser[inputuser.length - 1] != '0' &&
                    inputuser[inputuser.length - 1] != '1' &&
                    inputuser[inputuser.length - 1] != '2' &&
                    inputuser[inputuser.length - 1] != '3' &&
                    inputuser[inputuser.length - 1] != '4' &&
                    inputuser[inputuser.length - 1] != '5' &&
                    inputuser[inputuser.length - 1] != '6' &&
                    inputuser[inputuser.length - 1] != '7' &&
                    inputuser[inputuser.length - 1] != '8' &&
                    inputuser[inputuser.length - 1] != '9') {
                  inputuser = inputuser + '0' + event.value;
                } else {
                  inputuser = inputuser + event.value;
                }
              } else {}
            }

            emit(CalculatorState(result, inputuser));
          }
//------------------------------------------------------------------------------
          else if (event.value == '%') {
            if (inputuser.lastIndexOf('%') != inputuser.length - 1) {
              inputuser = inputuser + event.value;
            } else {}
            operator = event.value;
            emit(CalculatorState(result, inputuser));
          }
//------------------------------------------------------------------------------
          else if (event.value == '-') {
            if (inputuser.lastIndexOf('-') == inputuser.length - 1 ||
                inputuser.lastIndexOf('+') == inputuser.length - 1 ||
                inputuser.lastIndexOf('×') == inputuser.length - 1 ||
                inputuser.lastIndexOf('÷') == inputuser.length - 1) {
              inputuser = inputuser.substring(0, inputuser.length - 1);
              inputuser = inputuser + event.value;
            } else {
              inputuser = inputuser + event.value;
            }
            operator = event.value;
            emit(CalculatorState(result, inputuser));
          }
//------------------------------------------------------------------------------

          else if (event.value == '+') {
            if (inputuser.lastIndexOf('-') == inputuser.length - 1 ||
                inputuser.lastIndexOf('+') == inputuser.length - 1 ||
                inputuser.lastIndexOf('×') == inputuser.length - 1 ||
                inputuser.lastIndexOf('÷') == inputuser.length - 1) {
              inputuser = inputuser.substring(0, inputuser.length - 1);
              inputuser = inputuser + event.value;
            } else {
              inputuser = inputuser + event.value;
            }
            operator = event.value;
            emit(CalculatorState(result, inputuser));
          }
//------------------------------------------------------------------------------
          else if (event.value == '×') {
            if (inputuser.lastIndexOf('-') == inputuser.length - 1 ||
                inputuser.lastIndexOf('+') == inputuser.length - 1 ||
                inputuser.lastIndexOf('×') == inputuser.length - 1 ||
                inputuser.lastIndexOf('÷') == inputuser.length - 1) {
              inputuser = inputuser.substring(0, inputuser.length - 1);
              inputuser = inputuser + event.value;
            } else {
              inputuser = inputuser + event.value;
            }
            operator = event.value;
            emit(CalculatorState(result, inputuser));
          }
//------------------------------------------------------------------------------
          else if (event.value == '÷') {
            if (inputuser.lastIndexOf('-') == inputuser.length - 1 ||
                inputuser.lastIndexOf('+') == inputuser.length - 1 ||
                inputuser.lastIndexOf('×') == inputuser.length - 1 ||
                inputuser.lastIndexOf('÷') == inputuser.length - 1) {
              inputuser = inputuser.substring(0, inputuser.length - 1);
              inputuser = inputuser + event.value;
            } else {
              inputuser = inputuser + event.value;
            }
            operator = event.value;
            emit(CalculatorState(result, inputuser));
          }

//------------------------------------------------------------------------------
          else if (event.value == '(') {
            if (inputuser.lastIndexOf('-') == inputuser.length - 1 ||
                inputuser.lastIndexOf('+') == inputuser.length - 1 ||
                inputuser.lastIndexOf('×') == inputuser.length - 1 ||
                inputuser.lastIndexOf('÷') == inputuser.length - 1 ||
                inputuser.lastIndexOf('%') == inputuser.length - 1) {
              inputuser = inputuser + event.value;
            } else {
              if (inputuser == '0') {
                inputuser = '';
                inputuser = inputuser + event.value;
              } else {
                inputuser = inputuser + '×' + event.value;
              }
            }
            emit(CalculatorState(result, inputuser));
          }
//------------------------------------------------------------------------------
          else if (event.value == ')') {
            inputuser = inputuser + event.value;

            emit(CalculatorState(result, inputuser));
          }

//------------------------------------------------------------------------------
          else if (event.value == '!') {
            if (inputuser.lastIndexOf('-') == inputuser.length - 1 ||
                inputuser.lastIndexOf('+') == inputuser.length - 1 ||
                inputuser.lastIndexOf('×') == inputuser.length - 1 ||
                inputuser.lastIndexOf('÷') == inputuser.length - 1) {
              inputuser = inputuser.substring(0, inputuser.length - 1);
              inputuser = inputuser + event.value;
            } else {
              inputuser = inputuser + event.value;
            }
            emit(CalculatorState(result, inputuser));
          }
//------------------------------------------------------------------------------
          else {
            if (inputuser == '0') {
              inputuser = '';
              inputuser = inputuser + event.value;
            } else {
              inputuser = inputuser + event.value;
            }
            value = inputuser;
            emit(CalculatorState(result, inputuser));
          }

//------------------------------------------------------------------------------
        } catch (ex) {
          result = 'Format Error';
          emit(CalculatorState(result, inputuser));
        }
      },
    );
  }
}
