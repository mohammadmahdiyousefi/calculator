import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/bloc/calculator/calculator_bloc.dart';
import 'package:calculator/bloc/calculator/calculator_event.dart';
import 'package:calculator/bloc/calculator/input_calculator.dart';
import 'package:calculator/bloc/calculator/result_calculator.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../bloc/calculator/calculator_state.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 9,
              child: BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 6, child: _inputuser(context, state.input)),
                        const Gap(8),
                        Expanded(
                            flex: 2, child: _resultuser(context, state.result)),
                      ]),
                );
              }),
            ),
            Expanded(
              flex: 18,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: _keypad(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _resultuser(BuildContext context, ResultCalculatorState state) {
    return state is ResultCalculatorStateResult
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AutoSizeText(
                  formatMathExpression(state.resultCalculator),
                  minFontSize: 10,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ],
          )
        : state is ResultCalculatorStateError
            ? AutoSizeText(
                state.error,
                minFontSize: 10,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.red,
                    ),
                textAlign: TextAlign.end,
              )
            : Text(
                'error',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.end,
              );
  }

  Widget _inputuser(BuildContext context, InputCalculatorState state) {
    return state is InputCalculatorStateUser
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: AutoSizeText(formatMathExpression(state.input),
                    textAlign: TextAlign.end,
                    textDirection: TextDirection.ltr,
                    minFontSize: 15,
                    style: Theme.of(context).textTheme.displayLarge),
              ),
            ],
          )
        : Text('error', style: Theme.of(context).textTheme.displayLarge);
  }

  Widget _keypad(BuildContext context) {
    return Column(children: [
      // AC  CE  B  !
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  "AC",
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white, fontSize: 25),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context).add(CalculatorAC());
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  "CE",
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white, fontSize: 25),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context).add(CalculatorCE());
                },
                onLongPress: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorCETimer());
                },
                onLongPressEnd: (p0) {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorCETimerCancel());
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  'x^',
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('x^'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '!',
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('!'));
                },
              ),
            ),
          ],
        ),
      ),
      // (   )   %  ÷
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '(',
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('('));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  ')',
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent(')'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '%',
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('%'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '÷',
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('÷'));
                },
              ),
            ),
          ],
        ),
      ),
      // 7   8   9  x
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '7',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('7'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '8',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('8'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '9',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('9'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '×',
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('×'));
                },
              ),
            ),
          ],
        ),
      ),
      // 4   5   6  -
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '4',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('4'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '5',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('5'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '6',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('6'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '-',
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('-'));
                },
              ),
            ),
          ],
        ),
      ),
      // 3   2   1  +
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '1',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('1'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '2',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('2'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '3',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('3'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '+',
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('+'));
                },
              ),
            ),
          ],
        ),
      ),
      // 00  0   .  =
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '00',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('00'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '0',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('0'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '.',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                backgroundColor: Theme.of(context).cardColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEvent('.'));
                },
              ),
            ),
            Expanded(
              child: Button(
                icon: AutoSizeText(
                  '=',
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white, fontSize: 32),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                onTap: () {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(CalculatorEqual());
                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  String formatMathExpression(String expression) {
    return expression.replaceAllMapped(
      RegExp(r'\d+'),
      (Match match) {
        var number = match.group(0)!;
        return formatNumber(number);
      },
    );
  }

  String formatNumber(String number) {
    var buffer = StringBuffer();
    int len = number.length;
    for (int i = 0; i < len; i++) {
      if (i > 0 && (len - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(number[i]);
    }
    return buffer.toString();
  }
}
