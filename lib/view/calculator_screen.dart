import 'package:calculator/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            flex: 8,
            child: SizedBox(
              width: screenw,
              child: BlocBuilder<CalculatorBloc, ICalculatorState>(
                  builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                            child: state is CalculatorState
                                ? TextField(
                                    readOnly: true,
                                    maxLines: 10,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    textAlign: TextAlign.end,
                                    controller: state.calculate,
                                    keyboardType: TextInputType.none,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  )
                                : Text('error',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                            child: state is CalculatorState
                                ? TextField(
                                    readOnly: true,
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                    textAlign: TextAlign.end,
                                    controller: state.result,
                                    keyboardType: TextInputType.none,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  )
                                : Text(
                                    'error',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    textAlign: TextAlign.end,
                                  ),
                          ),
                        ),
                      ]),
                );
              }),
            ),
          ),
          Expanded(
            flex: 12,
            child: Container(
              width: screenw,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
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
