import 'package:calculator/bloc/calculator/calculator_bloc.dart';
import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:calculator/widgets/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator/calculator_event.dart';
import '../bloc/calculator/calculator_state.dart';
import '../widgets/calculator_bottoms.dart';

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
              child: const CalculatorBottoms(),
            ),
          )
        ],
      )),
    );
  }
}
