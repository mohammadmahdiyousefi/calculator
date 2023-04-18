import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<ICalculatorEvent, ICalculatorState> {
  TextEditingController inputuser = TextEditingController(text: '0');
  TextEditingController result = TextEditingController();
  String operator = '';
  String value = '';
  CalculatorBloc(super.initialState) {
    on<CalculatorEvent>(
      (event, emit) {
        try {
//-------Clear each one---------------------------------------------------------

          if (event.value == 'CE') {
            inputuser.text =
                inputuser.text.substring(0, inputuser.text.length - 1);
            if (inputuser.text.isEmpty) {
              inputuser.text = '0';
            } else {}
            result.text = '';
            emit(CalculatorState(result, inputuser));
          }

//----------Clear all-----------------------------------------------------------

          else if (event.value == 'AC') {
            inputuser.text = '0';
            result.text = '';
            emit(CalculatorState(result, inputuser));
          }

//--------------- equal --------------------------------------------------------

          else if (event.value == '=') {
            Parser parser = Parser();
            value = inputuser.text.replaceAll('×', '*');
            value = value.replaceAll('÷', '/');
            Expression expression = parser.parse(value);
            ContextModel contextModel = ContextModel();
            double result1 =
                expression.evaluate(EvaluationType.REAL, contextModel);
            result.text = result1.toString();

            emit(CalculatorState(result, inputuser));
          }

//--------------- power --------------------------------------------------------

          else if (event.value == 'x²' && inputuser.text != '') {
            inputuser.text = inputuser.text + '^(2)';
            emit(CalculatorState(result, inputuser));
          }
//--------point conditions------------------------------------------------------
          else if (event.value == '.') {
            if (inputuser.text.contains(event.value) == false) {
              if (inputuser.text[inputuser.text.length - 1] != '0' &&
                  inputuser.text[inputuser.text.length - 1] != '1' &&
                  inputuser.text[inputuser.text.length - 1] != '2' &&
                  inputuser.text[inputuser.text.length - 1] != '3' &&
                  inputuser.text[inputuser.text.length - 1] != '4' &&
                  inputuser.text[inputuser.text.length - 1] != '5' &&
                  inputuser.text[inputuser.text.length - 1] != '6' &&
                  inputuser.text[inputuser.text.length - 1] != '7' &&
                  inputuser.text[inputuser.text.length - 1] != '8' &&
                  inputuser.text[inputuser.text.length - 1] != '9') {
                inputuser.text = inputuser.text + '0' + event.value;
              } else {
                inputuser.text = inputuser.text + event.value;
              }
            } else if (inputuser.text.contains(event.value) == true) {
              if ((inputuser.text.substring(
                          inputuser.text.lastIndexOf(operator),
                          inputuser.text.length))
                      .contains(event.value) ==
                  false) {
                if (inputuser.text[inputuser.text.length - 1] != '0' &&
                    inputuser.text[inputuser.text.length - 1] != '1' &&
                    inputuser.text[inputuser.text.length - 1] != '2' &&
                    inputuser.text[inputuser.text.length - 1] != '3' &&
                    inputuser.text[inputuser.text.length - 1] != '4' &&
                    inputuser.text[inputuser.text.length - 1] != '5' &&
                    inputuser.text[inputuser.text.length - 1] != '6' &&
                    inputuser.text[inputuser.text.length - 1] != '7' &&
                    inputuser.text[inputuser.text.length - 1] != '8' &&
                    inputuser.text[inputuser.text.length - 1] != '9') {
                  inputuser.text = inputuser.text + '0' + event.value;
                } else {
                  inputuser.text = inputuser.text + event.value;
                }
              } else {}
            }

            emit(CalculatorState(result, inputuser));
          }
//----------------- Percent ----------------------------------------------------

          else if (event.value == '%') {
            if (inputuser.text.lastIndexOf('%') != inputuser.text.length - 1) {
              inputuser.text = inputuser.text + event.value;
            } else {}
            operator = event.value;
            emit(CalculatorState(result, inputuser));
          }

//----------------- minus ------------------------------------------------------

          else if (event.value == '-') {
            if (inputuser.text.lastIndexOf('-') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('+') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('×') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('÷') == inputuser.text.length - 1) {
              inputuser.text =
                  inputuser.text.substring(0, inputuser.text.length - 1);
              inputuser.text = inputuser.text + event.value;
            } else {
              inputuser.text = inputuser.text + event.value;
            }
            operator = event.value;
            emit(CalculatorState(result, inputuser));
          }

//--------------- plus ---------------------------------------------------------

          else if (event.value == '+') {
            if (inputuser.text.lastIndexOf('-') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('+') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('×') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('÷') == inputuser.text.length - 1) {
              inputuser.text =
                  inputuser.text.substring(0, inputuser.text.length - 1);
              inputuser.text = inputuser.text + event.value;
            } else {
              inputuser.text = inputuser.text + event.value;
            }
            operator = event.value;
            emit(CalculatorState(result, inputuser));
          }

//----------------- multiplication ---------------------------------------------

          else if (event.value == '×') {
            if (inputuser.text.lastIndexOf('-') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('+') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('×') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('÷') == inputuser.text.length - 1) {
              inputuser.text =
                  inputuser.text.substring(0, inputuser.text.length - 1);
              inputuser.text = inputuser.text + event.value;
            } else {
              inputuser.text = inputuser.text + event.value;
            }
            operator = event.value;
            emit(CalculatorState(result, inputuser));
          }

//--------------- Division -----------------------------------------------------

          else if (event.value == '÷') {
            if (inputuser.text.lastIndexOf('-') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('+') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('×') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('÷') == inputuser.text.length - 1) {
              inputuser.text =
                  inputuser.text.substring(0, inputuser.text.length - 1);
              inputuser.text = inputuser.text + event.value;
            } else {
              inputuser.text = inputuser.text + event.value;
            }
            operator = event.value;
            emit(CalculatorState(result, inputuser));
          }

//------------------------------------------------------------------------------

          else if (event.value == '(') {
            if (inputuser.text.lastIndexOf('-') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('+') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('×') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('÷') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('%') == inputuser.text.length - 1) {
              inputuser.text = inputuser.text + event.value;
            } else {
              if (inputuser.text == '0') {
                inputuser.text = '';
                inputuser.text = inputuser.text + event.value;
              } else {
                inputuser.text = inputuser.text + '×' + event.value;
              }
            }
            emit(CalculatorState(result, inputuser));
          }

//------------------------------------------------------------------------------

          else if (event.value == ')') {
            inputuser.text = inputuser.text + event.value;
            emit(CalculatorState(result, inputuser));
          }

//---------------- Factorial ---------------------------------------------------

          else if (event.value == '!') {
            if (inputuser.text.lastIndexOf('-') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('+') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('×') == inputuser.text.length - 1 ||
                inputuser.text.lastIndexOf('÷') == inputuser.text.length - 1) {
              inputuser.text =
                  inputuser.text.substring(0, inputuser.text.length - 1);
              inputuser.text = inputuser.text + event.value;
            } else {
              inputuser.text = inputuser.text + event.value;
            }
            emit(CalculatorState(result, inputuser));
          }

//------------------------------------------------------------------------------

          else {
            if (inputuser.text == '0') {
              inputuser.text = '';
              inputuser.text = inputuser.text + event.value;
            } else {
              inputuser.text = inputuser.text + event.value;
            }
            value = inputuser.text;
            emit(CalculatorState(result, inputuser));
          }

//------------------------------------------------------------------------------
        } catch (ex) {
          result.text = 'Format Error';
          emit(CalculatorState(result, inputuser));
        }

//------------------------------------------------------------------------------
      },
    );
  }
}
