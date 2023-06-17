import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<ICalculatorEvent, ICalculatorState> {
  String inputuser = "0";
  String result = "";
  String decimalresult = "";
  String operator = '';
  String value = '';

  CalculatorBloc(super.initialState) {
    on<CalculatorEvent>(
      (event, emit) {
        try {
//-------Clear each one---------------------------------------------------------

          if (event.value == 'CE') {
            if (inputuser == 'Format Error') {
              inputuser = '';
            } else {
              inputuser = inputuser.substring(0, inputuser.length - 1);

              if (inputuser.isEmpty) {
                inputuser = '0';
                operator = '';
              } else {}
            }

            result = '';

            emit(CalculatorState(result, inputuser));
          }

//----------Clear all-----------------------------------------------------------

          else if (event.value == 'AC') {
            inputuser = '0';
            result = '';
            operator = '';

            emit(CalculatorState(result, inputuser));
          }

//--------------- equal --------------------------------------------------------

          else if (event.value == '=') {
            if (result.isEmpty) {
              Parser parser = Parser();
              value = inputuser.replaceAll('×', '*');
              value = value.replaceAll('÷', '/');
              Expression expression = parser.parse(value);
              ContextModel contextModel = ContextModel();
              double result1 =
                  expression.evaluate(EvaluationType.REAL, contextModel);
              result = result1.toString();
              decimalresult = separateByComma(double.parse(result).toInt()) +
                  result.substring(result.lastIndexOf('.'));
            } else {
              inputuser = result;
              result = '';
              decimalresult = '';
            }

            emit(CalculatorState(decimalresult, inputuser));
          }

//--------------- power --------------------------------------------------------

          else if (event.value == 'x^' && inputuser != '') {
            inputuser = inputuser + '^';
            result = '';

            emit(CalculatorState(result, inputuser));
          }
//--------point conditions------------------------------------------------------
          else if (event.value == '.') {
            result = '';
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
//----------------- Percent ----------------------------------------------------

          else if (event.value == '%') {
            result = '';
            if (inputuser.lastIndexOf('%') != inputuser.length - 1) {
              inputuser = inputuser + event.value;
            } else {}
            operator = event.value;

            emit(CalculatorState(result, inputuser));
          }

//----------------- minus ------------------------------------------------------

          else if (event.value == '-') {
            result = '';
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

//--------------- plus ---------------------------------------------------------

          else if (event.value == '+') {
            result = '';
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

//----------------- multiplication ---------------------------------------------

          else if (event.value == '×') {
            result = '';
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

//--------------- Division -----------------------------------------------------

          else if (event.value == '÷') {
            result = '';
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
            result = '';
            if (inputuser.lastIndexOf('-') == inputuser.length - 1 ||
                inputuser.lastIndexOf('+') == inputuser.length - 1 ||
                inputuser.lastIndexOf('×') == inputuser.length - 1 ||
                inputuser.lastIndexOf('÷') == inputuser.length - 1 ||
                inputuser.lastIndexOf('%') == inputuser.length - 1 ||
                inputuser.lastIndexOf('^') == inputuser.length - 1) {
              inputuser = inputuser + event.value;
            } else {
              result = '';
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
            result = '';
            inputuser = inputuser + event.value;

            emit(CalculatorState(result, inputuser));
          }

//---------------- Factorial ---------------------------------------------------

          else if (event.value == '!') {
            result = '';
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
            result = '';
            if (inputuser == '0' || inputuser == '00') {
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
