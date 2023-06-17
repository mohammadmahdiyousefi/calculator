import 'package:adivery/adivery.dart';
import 'package:calculator/bloc/bmi/bmi_bloc.dart';
import 'package:calculator/bloc/bmi/bmi_event.dart';
import 'package:calculator/bloc/bmi/bmi_state.dart';
import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/constanc/snackbar_message.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:calculator/widgets/appbar_widget.dart';
import 'package:calculator/widgets/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
  double result = 0.0;
  Color resultcolor = Colors.grey.shade600;
  @override
  void initState() {
    super.initState();
    _showInterstitial();
  }

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
              decoration: const BoxDecoration(),
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                child: BlocBuilder<BmiBloc, IBmiState>(
                                    builder: (context, state) {
                                  return Center(
                                    child: Text(
                                        state is BmiState &&
                                                state.height.isNotEmpty
                                            ? state.height
                                            : 'Height (m)',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor)),
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: BlocBuilder<BmiBloc, IBmiState>(
                                    builder: (context, state) {
                                  return Center(
                                    child: Text(
                                        state is BmiState &&
                                                state.weight.isNotEmpty
                                            ? state.weight
                                            : 'Weight (kg)',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor)),
                                  );
                                })),
                          ),
                        ]),
                    Center(child: BlocBuilder<BmiBloc, IBmiState>(
                        builder: (context, state) {
                      return CircularPercentIndicator(
                        radius: screenh / 8,
                        percent: state is BmiState
                            ? state.result == 0
                                ? 0
                                : state.result / 100 + 0.5
                            : result,
                        lineWidth: 12,
                        animation: true,
                        progressColor: state is BmiState &&
                                (state.height.isNotEmpty ||
                                    state.weight.isNotEmpty)
                            ? state.color
                            : resultcolor,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text(
                          '${state is BmiState ? state.result : result}',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      );
                    })),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 12,
                                  width: 12,
                                  color: Colors.blue,
                                ),
                                Text(
                                  ' Below 18.5',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            const Text(
                              'Underweight',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 12,
                                  width: 12,
                                  color: Colors.green,
                                ),
                                Text(
                                  ' 18.5 – 24.9',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            const Text(
                              'Healthy Weight',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 10),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 12,
                                  width: 12,
                                  color: Colors.orange,
                                ),
                                Text(
                                  ' 25.0 – 29.9',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            const Text(
                              'Overweight',
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 10),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 12,
                                  width: 12,
                                  color: Colors.red,
                                ),
                                Text(
                                  ' 30.0 and Above',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            const Text(
                              'Obesity',
                              style: TextStyle(color: Colors.red, fontSize: 10),
                            )
                          ],
                        ),
                      ],
                    ),
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
              child: Buttons(height: height, weight: weight),
            ),
          )
        ],
      )),
    );
  }

  void _showInterstitial() {
    AdiveryPlugin.isLoaded('b27de982-c95c-4adf-b865-0b3720e32517').then(
        (isLoaded) =>
            showPlacement(isLoaded!, 'b27de982-c95c-4adf-b865-0b3720e32517'));
  }

  void showPlacement(bool isLoaded, String placementId) {
    if (isLoaded) {
      AdiveryPlugin.show(placementId);
    }
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.height,
    required this.weight,
  });

  final bool height;
  final bool weight;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    Clikbutton(
                        ButtonModel(
                            titel: '7',
                            titelcolor: Colors.white,
                            bottomcolor: Colors.grey.shade800),
                        height,
                        weight),
                    Clikbutton(
                        ButtonModel(
                            titel: '8',
                            titelcolor: Colors.white,
                            bottomcolor: Colors.grey.shade800),
                        height,
                        weight),
                    Clikbutton(
                        ButtonModel(
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
                    Clikbutton(
                        ButtonModel(
                            titel: '4',
                            titelcolor: Colors.white,
                            bottomcolor: Colors.grey.shade800),
                        height,
                        weight),
                    Clikbutton(
                        ButtonModel(
                            titel: '5',
                            titelcolor: Colors.white,
                            bottomcolor: Colors.grey.shade800),
                        height,
                        weight),
                    Clikbutton(
                        ButtonModel(
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
                    Clikbutton(
                        ButtonModel(
                            titel: '1',
                            titelcolor: Colors.white,
                            bottomcolor: Colors.grey.shade800),
                        height,
                        weight),
                    Clikbutton(
                        ButtonModel(
                            titel: '2',
                            titelcolor: Colors.white,
                            bottomcolor: Colors.grey.shade800),
                        height,
                        weight),
                    Clikbutton(
                        ButtonModel(
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
                    Clikbutton(
                        ButtonModel(
                            titel: '00',
                            titelcolor: Colors.white,
                            bottomcolor: Colors.grey.shade800),
                        height,
                        weight),
                    Clikbutton(
                        ButtonModel(
                            titel: '0',
                            titelcolor: Colors.white,
                            bottomcolor: Colors.grey.shade800),
                        height,
                        weight),
                    Clikbutton(
                        ButtonModel(
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
            Clikbutton(
                ButtonModel(
                  titel: 'AC',
                  titelcolor: AppColor.brightorange,
                  bottomcolor: AppColor.bottomcolor,
                ),
                height,
                weight),
            Clikbutton(
                ButtonModel(
                  titel: 'CE',
                  titelcolor: AppColor.brightorange,
                  bottomcolor: AppColor.bottomcolor,
                ),
                height,
                weight),
            Clikbutton(
                ButtonModel(
                  titel: '=',
                  titelcolor: AppColor.bottomtitel,
                  bottomcolor: AppColor.customorange,
                ),
                height,
                weight),
          ],
        )
      ],
    );
  }
}

class Clikbutton extends StatelessWidget {
  Clikbutton(this.model, this.height, this.weight, {super.key});
  ButtonModel model;
  bool height = false;
  bool weight = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (model.titel == '=' &&
            BlocProvider.of<BmiBloc>(context).height.isEmpty &&
            BlocProvider.of<BmiBloc>(context).weight.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackbarMessage.bmimessage);
        } else if (model.titel == '=' &&
            BlocProvider.of<BmiBloc>(context).height.isEmpty &&
            BlocProvider.of<BmiBloc>(context).weight.isNotEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackbarMessage.bmimessage2);
        } else if (model.titel == '=' &&
            BlocProvider.of<BmiBloc>(context).height.isNotEmpty &&
            BlocProvider.of<BmiBloc>(context).weight.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackbarMessage.bmimessage1);
        } else if (model.titel == '=' &&
            double.parse(BlocProvider.of<BmiBloc>(context).height) >= 10) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackbarMessage.bmimessage3);
        } else {
          if (height == true) {
            BlocProvider.of<BmiBloc>(context).add(HeightEvent(model.titel));
            if (double.parse(BlocProvider.of<BmiBloc>(context).height) >= 10) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackbarMessage.bmimessage3);
            } else {}
          } else if (weight == true) {
            BlocProvider.of<BmiBloc>(context).add(WeightEvent(model.titel));
          } else {}
        }
      },
      child: Bottom(property: model),
    );
  }
}
