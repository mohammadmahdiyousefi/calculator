import 'package:calculator/bloc/bmi/bmi_bloc.dart';
import 'package:calculator/bloc/bmi/bmi_event.dart';
import 'package:calculator/bloc/bmi/bmi_state.dart';
import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:calculator/widgets/appbar_widget.dart';
import 'package:calculator/widgets/bottom.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  var setw = TextEditingController();
  var seth = TextEditingController();
  bool height = false;
  bool weight = false;
  String result = '0.0';
  Color resultcolor = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    var screenh = MediaQuery.of(context).size.height;
    var screenw = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appbarwidget(context: context, titel: 'Bmi'),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: screenw,
              decoration: BoxDecoration(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (height == false) {
                                  height = !height;
                                  weight = !height;
                                } else {}
                              });
                            },
                            child: Container(
                                height: 50,
                                width: screenw / 3,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: height == true
                                          ? AppColor.brightorange
                                          : Colors.grey.shade600,
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: BlocBuilder<BmiBloc, IBmiState>(
                                    builder: (context, state) {
                                  return Center(
                                    child: Text(state is BmiState &&
                                            state.height.isNotEmpty
                                        ? state.height
                                        : 'Height (m)'),
                                  );
                                })),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (weight == false) {
                                  weight = !weight;
                                  height = !weight;
                                } else {}
                              });
                            },
                            child: Container(
                                height: 50,
                                width: screenw / 3,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: weight == true
                                            ? AppColor.brightorange
                                            : Colors.grey.shade600,
                                        width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: BlocBuilder<BmiBloc, IBmiState>(
                                    builder: (context, state) {
                                  return Center(
                                    child: Text(
                                      state is BmiState &&
                                              state.weight.isNotEmpty
                                          ? state.weight
                                          : 'Weight (kg)',
                                    ),
                                  );
                                })),
                          ),
                        ]),
                    Center(
                      child: BlocBuilder<BmiBloc, IBmiState>(
                          builder: (context, state) {
                        return Container(
                          height: screenh / 4,
                          width: screenh / 4,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: state is BmiState &&
                                          (state.height.isNotEmpty ||
                                              state.weight.isNotEmpty)
                                      ? state.color
                                      : resultcolor,
                                  width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1000))),
                          child: Center(
                            child: Text(
                              '${state is BmiState ? state.result : result}',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.grey),
                            ),
                          ),
                        );
                      }),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: screenw,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Clikbottom(
                                  BottomModel(
                                      titel: '7',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                              Clikbottom(
                                  BottomModel(
                                      titel: '8',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                              Clikbottom(
                                  BottomModel(
                                      titel: '9',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Clikbottom(
                                  BottomModel(
                                      titel: '4',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                              Clikbottom(
                                  BottomModel(
                                      titel: '5',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                              Clikbottom(
                                  BottomModel(
                                      titel: '6',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Clikbottom(
                                  BottomModel(
                                      titel: '1',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                              Clikbottom(
                                  BottomModel(
                                      titel: '2',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                              Clikbottom(
                                  BottomModel(
                                      titel: '3',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Clikbottom(
                                  BottomModel(
                                      titel: '00',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                              Clikbottom(
                                  BottomModel(
                                      titel: '0',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                              Clikbottom(
                                  BottomModel(
                                      titel: '.',
                                      titelcolor: Colors.white,
                                      bottomcolor: Colors.grey.shade800),
                                  height,
                                  weight),
                            ],
                          ),
                        ]),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Clikbottom(
                          BottomModel(
                            titel: 'AC',
                            titelcolor: AppColor.brightorange,
                            bottomcolor: AppColor.bottomcolor,
                          ),
                          height,
                          weight),
                      Clikbottom(
                          BottomModel(
                            titel: 'CE',
                            titelcolor: AppColor.brightorange,
                            bottomcolor: AppColor.bottomcolor,
                          ),
                          height,
                          weight),
                      Clikbottom(
                          BottomModel(
                            titel: '=',
                            titelcolor: AppColor.bottomtitel,
                            bottomcolor: AppColor.customorange,
                          ),
                          height,
                          weight),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class Clikbottom extends StatelessWidget {
  Clikbottom(this.model, this.height, this.weight, {super.key});
  BottomModel model;
  bool height = false;
  bool weight = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (height == true) {
          BlocProvider.of<BmiBloc>(context).add(HeightEvent(model.titel));
        } else if (weight == true) {
          BlocProvider.of<BmiBloc>(context).add(WeightEvent(model.titel));
        } else {}
      },
      child: Bottom(property: model),
    );
  }
}
