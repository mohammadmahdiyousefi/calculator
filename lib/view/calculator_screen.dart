import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/bloc/calculator/calculator_bloc.dart';
import 'package:calculator/bloc/calculator/calculator_event.dart';
import 'package:calculator/bloc/calculator/input_calculator.dart';
import 'package:calculator/bloc/calculator/result_calculator.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:calculator/widgets/bottom.dart';
import 'package:calculator/widgets/prepare_interstitial_ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator/calculator_state.dart';
import '../constanc/app_colors.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      showInterstitial();
      timer.cancel();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          flex: 2, child: _inputuser(context, state.input)),
                      Expanded(
                          flex: 1, child: _resultuser(context, state.result)),
                    ]),
              );
            }),
          ),
          Expanded(
            flex: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: _keypad(context),
            ),
          ),
        ],
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
                  state.resultCalculator,
                  minFontSize: 15,
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
                minFontSize: 20,
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
                child: AutoSizeText(state.input,
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
              child: clickbutton(
                ButtonModel(
                  titel: 'AC',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: 'CE',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: 'x^',
                  titelcolor: Theme.of(context).primaryColorLight,
                  bottomcolor: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '!',
                  titelcolor: Theme.of(context).primaryColorLight,
                  bottomcolor: Theme.of(context).primaryColorDark,
                ),
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
              child: clickbutton(
                ButtonModel(
                  titel: '(',
                  titelcolor: Theme.of(context).primaryColorLight,
                  bottomcolor: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: ')',
                  titelcolor: Theme.of(context).primaryColorLight,
                  bottomcolor: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '%',
                  titelcolor: Theme.of(context).primaryColorLight,
                  bottomcolor: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '÷',
                  titelcolor: Theme.of(context).primaryColorLight,
                  bottomcolor: Theme.of(context).primaryColorDark,
                ),
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
              child: clickbutton(
                ButtonModel(
                  titel: '7',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '8',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '9',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '×',
                  titelcolor: Theme.of(context).primaryColorLight,
                  bottomcolor: Theme.of(context).primaryColorDark,
                ),
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
              child: clickbutton(
                ButtonModel(
                  titel: '4',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '5',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '6',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '-',
                  titelcolor: Theme.of(context).primaryColorLight,
                  bottomcolor: Theme.of(context).primaryColorDark,
                ),
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
              child: clickbutton(
                ButtonModel(
                  titel: '1',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '2',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '3',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '+',
                  titelcolor: Theme.of(context).primaryColorLight,
                  bottomcolor: Theme.of(context).primaryColorDark,
                ),
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
              child: clickbutton(
                ButtonModel(
                  titel: '00',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '0',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '.',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              child: clickbutton(
                ButtonModel(
                  titel: '=',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget clickbutton(ButtonModel model) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<CalculatorBloc>(context).add(CalculatorEvent(
          model.titel,
        ));
      },
      child: Bottom(property: model),
    );
  }
}
