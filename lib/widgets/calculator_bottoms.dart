import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator/calculator_bloc.dart';
import '../bloc/calculator/calculator_event.dart';
import '../constanc/app_colors.dart';
import '../model/bottom_model.dart';
import 'bottom.dart';

// ignore: must_be_immutable
class KeyPad extends StatelessWidget {
  const KeyPad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      // AC  CE  B  !
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            ButtonModel(
              titel: 'AC',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).primaryColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: 'CE',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).primaryColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: 'x^',
              titelcolor: Theme.of(context).primaryColorLight,
              bottomcolor: Theme.of(context).primaryColorDark,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '!',
              titelcolor: Theme.of(context).primaryColorLight,
              bottomcolor: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
      // (   )   %  ÷
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            ButtonModel(
              titel: '(',
              titelcolor: Theme.of(context).primaryColorLight,
              bottomcolor: Theme.of(context).primaryColorDark,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: ')',
              titelcolor: Theme.of(context).primaryColorLight,
              bottomcolor: Theme.of(context).primaryColorDark,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '%',
              titelcolor: Theme.of(context).primaryColorLight,
              bottomcolor: Theme.of(context).primaryColorDark,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '÷',
              titelcolor: Theme.of(context).primaryColorLight,
              bottomcolor: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
      // 7   8   9  x
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            ButtonModel(
              titel: '7',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '8',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '9',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '×',
              titelcolor: Theme.of(context).primaryColorLight,
              bottomcolor: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
      // 4   5   6  -
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            ButtonModel(
              titel: '4',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '5',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '6',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '-',
              titelcolor: Theme.of(context).primaryColorLight,
              bottomcolor: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
      // 3   2   1  +
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            ButtonModel(
              titel: '1',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '2',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '3',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '+',
              titelcolor: Theme.of(context).primaryColorLight,
              bottomcolor: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
      // 00  0   .  =
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            ButtonModel(
              titel: '00',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '0',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '.',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).canvasColor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '=',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    ]);
  }
}

// ignore: must_be_immutable
class Clikbottom extends StatelessWidget {
  Clikbottom(this.model, {super.key});
  ButtonModel model;
  @override
  Widget build(BuildContext context) {
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
