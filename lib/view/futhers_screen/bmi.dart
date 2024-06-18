import 'dart:async';
import 'package:adivery/adivery.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/bloc/bmi/bmi_bloc.dart';
import 'package:calculator/bloc/bmi/bmi_event.dart';
import 'package:calculator/bloc/bmi/bmi_state.dart';
import 'package:calculator/constanc/snackbar_message.dart';
import 'package:calculator/widgets/appbar_widget.dart';
import 'package:calculator/widgets/button.dart';
import 'package:calculator/widgets/prepare_interstitial_ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

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
  @override
  void initState() {
    super.initState();
    AdiveryPlugin.prepareInterstitialAd('b27de982-c95c-4adf-b865-0b3720e32517');
    showInterstitial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarwidget(context: context, titel: 'BMI'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        cursorColor: Theme.of(context).primaryColor,
                        focusNode: heightnode,
                        controller: seth,
                        keyboardType: TextInputType.none,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 16),
                        decoration: InputDecoration(
                            hintText: "Height",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey),
                            filled: true,
                            contentPadding:
                                const EdgeInsets.only(left: 16, right: 16),
                            fillColor: Theme.of(context).cardColor,
                            suffixIconConstraints:
                                const BoxConstraints(minWidth: 32),
                            suffixIcon: Text(
                              "cm",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(12),
                            )),
                      ),
                      TextField(
                        cursorColor: Theme.of(context).primaryColor,
                        focusNode: weightnode,
                        controller: setw,
                        keyboardType: TextInputType.none,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 16),
                        decoration: InputDecoration(
                            hintText: "Weight",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
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
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(12),
                            )),
                      ),
                      TextField(
                        cursorColor: Theme.of(context).primaryColor,
                        focusNode: agenode,
                        controller: seta,
                        keyboardType: TextInputType.none,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 16),
                        decoration: InputDecoration(
                            hintText: "Age",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey),
                            filled: true,
                            contentPadding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                            ),
                            fillColor: Theme.of(context).cardColor,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(12),
                            )),
                      ),
                    ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: _keypad(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _keypad(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Expanded(child: buildNumberRow('7', '8', '9')),
              Expanded(child: buildNumberRow('4', '5', '6')),
              Expanded(child: buildNumberRow('1', '2', '3')),
              Expanded(child: buildNumberRow('00', '0', '.')),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                  child: buildFunctionButton('AC',
                      backgroundColor: Theme.of(context).cardColor,
                      titel: Theme.of(context).primaryColor)),
              Expanded(
                  child: buildFunctionButton('CE',
                      backgroundColor: Theme.of(context).cardColor,
                      titel: Theme.of(context).primaryColor)),
              Expanded(
                  child: buildFunctionButton('GO',
                      titel: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildNumberRow(
      String rowNumber1, String rowNumber2, String rowNumber3) {
    return Row(
      children: [
        Expanded(child: buildNumberButton(rowNumber1)),
        Expanded(child: buildNumberButton(rowNumber2)),
        Expanded(child: buildNumberButton(rowNumber3)),
      ],
    );
  }

  Widget buildNumberButton(String number) {
    return Button(
      icon: AutoSizeText(
        number,
        minFontSize: 8,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      backgroundColor: Theme.of(context).cardColor,
      onTap: onTap(context, number),
    );
  }

  Widget buildFunctionButton(String label,
      {Color backgroundColor = Colors.black, Color titel = Colors.black}) {
    return Button(
      icon: AutoSizeText(
        label,
        minFontSize: 10,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: titel, fontSize: 24),
      ),
      backgroundColor: backgroundColor,
      onTap: onTap(context, label),
    );
  }

  void Function()? onTap(BuildContext context, String titel) {
    return () {
      switch (titel) {
        case 'AC':
          _clearTextFields();
          break;
        case 'CE':
          _deleteFocusedTextField();
          break;
        case 'GO':
          _validateAndProcessInput();
          break;
        default:
          _appendTextToFocusedField(titel);
          break;
      }

      setState(() {});
    };
  }

  void _clearTextFields() {
    seth.text = "";
    setw.text = "";
    seta.text = "";
  }

  void _deleteFocusedTextField() {
    if (heightnode.hasFocus && seth.text.isNotEmpty) {
      seth.text = seth.text.substring(0, seth.text.length - 1);
    } else if (weightnode.hasFocus && setw.text.isNotEmpty) {
      setw.text = setw.text.substring(0, setw.text.length - 1);
    } else if (agenode.hasFocus && seta.text.isNotEmpty) {
      seta.text = seta.text.substring(0, seta.text.length - 1);
    }
  }

  void _validateAndProcessInput() {
    if (seth.text.isEmpty && setw.text.isEmpty && seta.text.isEmpty) {
      SnackbarMessage.customsnackbar(
          context, "Please complete all fields", Colors.red);
      return;
    }

    final double? height = double.tryParse(seth.text);
    if (height == null) {
      SnackbarMessage.customsnackbar(
          context, "Please enter a valid height", Colors.red);
      return;
    }

    final double? weight = double.tryParse(setw.text);
    if (weight == null) {
      SnackbarMessage.customsnackbar(
          context, "Please enter a valid weight", Colors.red);
      return;
    }

    final int? age = int.tryParse(seta.text);
    if (age == null) {
      SnackbarMessage.customsnackbar(
          context, "Please enter a valid age", Colors.red);
      return;
    }

    showCustomDialog(context, age, height, weight);
  }

  void _appendTextToFocusedField(String text) {
    if (heightnode.hasFocus) {
      seth.text += text;
    } else if (weightnode.hasFocus) {
      setw.text += text;
    } else if (agenode.hasFocus) {
      seta.text += text;
    }
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
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
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const Gap(8),
                        Text(
                          "Underweight = 18.5 <",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: const Color(0xFF2196F3)),
                        ),
                        const Gap(8),
                        Text(
                          "Healthy Weight = 18.5-24.9",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: const Color(0xFF4CAF50)),
                        ),
                        const Gap(8),
                        Text(
                          "OverWeight = 25-29.9",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: const Color(0xFFFF7552)),
                        ),
                        const Gap(8),
                        Text(
                          "Obesity = <30",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
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
                    style: Theme.of(context).textTheme.bodySmall,
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
