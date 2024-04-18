import 'dart:async';
import 'package:adivery/adivery.dart';
import 'package:calculator/bloc/bmi/bmi_bloc.dart';
import 'package:calculator/bloc/bmi/bmi_event.dart';
import 'package:calculator/bloc/bmi/bmi_state.dart';
import 'package:calculator/constanc/snackbar_message.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:calculator/widgets/appbar_widget.dart';
import 'package:calculator/widgets/bottom.dart';
import 'package:calculator/widgets/prepare_interstitial_ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController setw = TextEditingController();
  final TextEditingController seth = TextEditingController();
  final TextEditingController seta = TextEditingController();
  final FocusNode weightnode = FocusNode();
  final FocusNode heightnode = FocusNode();
  final FocusNode agenode = FocusNode();
  late Timer timer;
  @override
  void initState() {
    super.initState();
    AdiveryPlugin.prepareInterstitialAd('b27de982-c95c-4adf-b865-0b3720e32517');
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
      appBar: appbarwidget(context: context, titel: 'BMI'),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text("your Height",
                                style: Theme.of(context).textTheme.labelLarge),
                          ),
                          Expanded(
                              flex: 4,
                              child: SizedBox(
                                height: 50,
                                child: TextField(
                                  cursorColor: Theme.of(context).primaryColor,
                                  focusNode: heightnode,
                                  controller: seth,
                                  keyboardType: TextInputType.none,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(fontSize: 18),
                                  decoration: InputDecoration(
                                      hintText: "Height",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(color: Colors.grey),
                                      filled: true,
                                      contentPadding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      fillColor: Theme.of(context).cardColor,
                                      suffixIconConstraints:
                                          const BoxConstraints(minWidth: 32),
                                      suffixIcon: Text(
                                        "cm",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      )),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text("your Weight",
                                style: Theme.of(context).textTheme.labelLarge),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              cursorColor: Theme.of(context).primaryColor,
                              focusNode: weightnode,
                              controller: setw,
                              keyboardType: TextInputType.none,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontSize: 18),
                              decoration: InputDecoration(
                                  hintText: "Weight",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(color: Colors.grey),
                                  filled: true,
                                  contentPadding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                  ),
                                  fillColor: Theme.of(context).cardColor,
                                  suffixIconConstraints:
                                      const BoxConstraints(minWidth: 32),
                                  suffixIcon: Text(
                                    "kg",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text("your Age",
                                style: Theme.of(context).textTheme.labelLarge),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              cursorColor: Theme.of(context).primaryColor,
                              focusNode: agenode,
                              controller: seta,
                              keyboardType: TextInputType.none,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontSize: 18),
                              decoration: InputDecoration(
                                  hintText: "Age",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(color: Colors.grey),
                                  filled: true,
                                  contentPadding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                  ),
                                  fillColor: Theme.of(context).cardColor,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: buttons(context),
            ),
          )
        ],
      ),
    );
  }

  Widget buttons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '7',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '8',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '9',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '4',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '5',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '6',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '1',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '2',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '3',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '00',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '0',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: clikbutton(
                          context,
                          ButtonModel(
                            titel: '.',
                            titelcolor: Colors.white,
                            bottomcolor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: clikbutton(
                    context,
                    ButtonModel(
                      titel: 'AC',
                      titelcolor: Theme.of(context).primaryColorLight,
                      bottomcolor: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
                Expanded(
                  child: clikbutton(
                    context,
                    ButtonModel(
                      titel: 'CE',
                      titelcolor: Theme.of(context).primaryColorLight,
                      bottomcolor: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
                Expanded(
                  child: clikbutton(
                    context,
                    ButtonModel(
                      titel: 'GO',
                      titelcolor: Colors.white,
                      bottomcolor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget clikbutton(BuildContext context, ButtonModel model) {
    return GestureDetector(
      onTap: () {
        if (model.titel == "AC") {
          if (heightnode.hasFocus) {
            seth.text = '';
          } else if (weightnode.hasFocus) {
            setw.text = '';
          } else if (agenode.hasFocus) {
            seta.text = '';
          }
          setState(() {});
        } else if (model.titel == "CE") {
          if (heightnode.hasFocus && seth.text.isNotEmpty) {
            seth.text = seth.text.substring(0, seth.text.length - 1);
          } else if (weightnode.hasFocus && setw.text.isNotEmpty) {
            setw.text = setw.text.substring(0, setw.text.length - 1);
          } else if (agenode.hasFocus && seta.text.isNotEmpty) {
            seta.text = seta.text.substring(0, seta.text.length - 1);
          }
          setState(() {});
        } else if (model.titel == "GO") {
          if (seth.text.isEmpty || setw.text.isEmpty || seta.text.isEmpty) {
            SnackbarMessage.customsnackbar(
                context, "Please complete all fields", Colors.red);
          } else {
            final double? height = double.tryParse(seth.text);
            final double? weight = double.tryParse(setw.text);
            final int? age = int.tryParse(seta.text);
            if (height == null) {
              SnackbarMessage.customsnackbar(
                  context, "Please enter a valid height", Colors.red);
            } else if (weight == null) {
              SnackbarMessage.customsnackbar(
                  context, "Please enter a valid weight", Colors.red);
            } else if (age == null) {
              SnackbarMessage.customsnackbar(
                  context, "Please enter a valid age", Colors.red);
            } else {
              showCustomDialog(context, int.parse(seta.text),
                  double.parse(seth.text), double.parse(setw.text));
            }
          }
        } else {
          if (heightnode.hasFocus) {
            seth.text = seth.text + model.titel;
          } else if (weightnode.hasFocus) {
            setw.text = setw.text + model.titel;
          } else if (agenode.hasFocus) {
            seta.text = seta.text + model.titel;
          }
          setState(() {});
        }
      },
      child: Bottom(property: model),
    );
  }

  Future<void> showCustomDialog(
      BuildContext ctx, int age, double height, double weight) async {
    await showDialog(
      context: ctx,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          elevation: 0,
          actionsPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(16),
          buttonPadding: const EdgeInsets.all(0),
          titlePadding: const EdgeInsets.all(0),
          scrollable: true,
          content: BlocProvider(
            create: (context) {
              var bloc = BmiBloc();
              bloc.add(BMICalculateEvent(age, height, weight));
              return bloc;
            },
            child: BlocBuilder<BmiBloc, BmiState>(
              builder: (context, state) {
                if (state is BmiResultState) {
                  // double result = state.result < 16
                  //     ? 16
                  //     : state.result > 30
                  //         ? 30
                  //         : state.result;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.result.toString(),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const Gap(8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BMI",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  state.bodystatus,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: state.color),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(16),
                        Container(
                          height: 10,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Colors.blue,
                            Colors.green,
                            Colors.red
                          ])),
                          // child: Stack(
                          //   children: [
                          //     Positioned(
                          //       left: state.result,
                          //       top: 0.0,
                          //       bottom: 0.0,
                          //       child: Container(
                          //         width: 4.0,
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   ],
                          //  ),
                        ),
                        const Gap(24),
                        Text(
                          "BMI categorise : ",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const Gap(8),
                        Text(
                          "Underweight = 18.5 <",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: const Color(0xFF2196F3)),
                        ),
                        const Gap(8),
                        Text(
                          "Healthy Weight = 18.5-24.9",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: const Color(0xFF4CAF50)),
                        ),
                        const Gap(8),
                        Text(
                          "OverWeight = 25-29.9",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: const Color(0xFFFF7552)),
                        ),
                        const Gap(8),
                        Text(
                          "Obesity = <30",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: const Color(0xFFF44336)),
                        ),
                      ],
                    ),
                  );
                } else if (state is BmiLoadingState) {
                  return CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  );
                } else if (state is BmiInitState) {
                  return CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  );
                } else if (state is BmiErrorState) {
                  return Text(
                    state.error,
                    style: Theme.of(context).textTheme.labelLarge,
                  );
                } else {
                  return CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
