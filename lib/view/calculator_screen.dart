import 'package:calculator/bloc/calculator/calculator_bloc.dart';
import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:calculator/widgets/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator/calculator_event.dart';
import '../bloc/calculator/calculator_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputuser = '';
  String result = '';

//-------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    //گرفتن سایز صفحه
    var screenw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: screenw,
              child: BlocBuilder<CalculatorBloc, ICalculatorState>(
                  builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 15,
                          ),
                          if (state is CalculatorState) ...{
                            Text(
                              state.calculate,
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.end,
                            ),
                          } else ...{
                            Text('error',
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                          },
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 16,
                          ),
                          if (state is CalculatorState) ...{
                            Text(state.result,
                                textAlign: TextAlign.end,
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                          } else ...{
                            Text(
                              'error',
                              style: Theme.of(context).textTheme.displayMedium,
                              textAlign: TextAlign.end,
                            ),
                          },
                        ]),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: screenw,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: keys(),
            ),
          )
        ],
      )),
    );
  }

//------------------------------------------------------------------------------------
  Widget keys() {
    var fontsize = MediaQuery.of(context).size.width / 16;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      // AC  CE  B  !
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            BottomModel(
              titel: 'AC',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.customorange,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: 'CE',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.customorange,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: 'x²',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '!',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
              fontsize: fontsize,
            ),
          ),
        ],
      ),
      // (   )   %  ÷
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            BottomModel(
              titel: '(',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: ')',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '%',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '÷',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
              fontsize: fontsize,
            ),
          ),
        ],
      ),
      // 7   8   9  x
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            BottomModel(
              titel: '7',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '8',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '9',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '×',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
              fontsize: fontsize,
            ),
          ),
        ],
      ),
      // 4   5   6  -
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            BottomModel(
              titel: '4',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '5',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '6',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '-',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
              fontsize: fontsize,
            ),
          ),
        ],
      ),
      // 3   2   1  +
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            BottomModel(
              titel: '1',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '2',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '3',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '+',
              titelcolor: AppColor.brightorange,
              bottomcolor: AppColor.bottomcolor,
              fontsize: fontsize,
            ),
          ),
        ],
      ),
      // 00  0   .  =
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Clikbottom(
            BottomModel(
              titel: '00',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '0',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '.',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.numberbottomcolor,
              fontsize: fontsize,
            ),
          ),
          Clikbottom(
            BottomModel(
              titel: '=',
              titelcolor: AppColor.bottomtitel,
              bottomcolor: AppColor.customorange,
              fontsize: fontsize,
            ),
          ),
        ],
      ),
    ]);
  }
}

class Clikbottom extends StatelessWidget {
  Clikbottom(this.model, {super.key});
  BottomModel model;

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
