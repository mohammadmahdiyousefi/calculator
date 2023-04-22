import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculator/calculator_bloc.dart';
import '../bloc/calculator/calculator_event.dart';
import '../constanc/app_colors.dart';
import '../constanc/snackbar_message.dart';
import '../model/bottom_model.dart';
import 'bottom.dart';

class CalculatorBottoms extends StatelessWidget {
  const CalculatorBottoms({super.key});

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
              bottomcolor: AppColor.customorange,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: 'CE',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.customorange,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: 'x²',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '!',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
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
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: ')',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '%',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '÷',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
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
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '8',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '9',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '×',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
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
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '5',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '6',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '-',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
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
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '2',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '3',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '+',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
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
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '0',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '.',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
            ),
          ),
          Clikbottom(
            ButtonModel(
              titel: '=',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.customorange,
            ),
          ),
        ],
      ),
    ]);
  }
}

class Clikbottom extends StatelessWidget {
  Clikbottom(this.model, {super.key});
  ButtonModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (BlocProvider.of<CalculatorBloc>(context)
        //             .inputuser
        //             .text
        //             .substring(BlocProvider.of<CalculatorBloc>(context)
        //                 .inputuser
        //                 .text
        //                 .lastIndexOf(
        //                   BlocProvider.of<CalculatorBloc>(context).operator,
        //                 ))
        //             .length ==
        //         15 &&
        //     model.titel != 'CE' &&
        //     model.titel != 'AC' &&
        //     model.titel != '⇌') {
        //   ScaffoldMessenger.of(context).showSnackBar(SnackbarMessage.message);
        // } else {
        BlocProvider.of<CalculatorBloc>(context).add(CalculatorEvent(
          model.titel,
        ));
      },
      child: Bottom(property: model),
    );
  }
}
