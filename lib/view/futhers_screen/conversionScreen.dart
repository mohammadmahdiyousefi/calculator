import 'package:adivery/adivery.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/bloc/unitconversion/unitconversion_event.dart';
import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/constanc/snackbar_message.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:calculator/model/capabilities.dart';
import 'package:calculator/widgets/appbar_widget.dart';
import 'package:calculator/widgets/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/unitconversion/unitconversion_bloc.dart';
import '../../bloc/unitconversion/unitconversion_state.dart';

// ignore: must_be_immutable
class ConversionScreen extends StatefulWidget {
  ConversionScreen(this.items, this.titel, {Key? key}) : super(key: key);
  List<Capabilities> items;
  String titel;
  @override
  State<ConversionScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  String text = "";

//------------------------------------------------------------------------------
  var controller = DraggableScrollableController();
  var controller1 = DraggableScrollableController();

//------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    _showInterstitial();

    BlocProvider.of<UnitconversionBloc>(context).add(Settitel(widget.titel));
    BlocProvider.of<UnitconversionBloc>(context).add(Unit(widget.items[0]));
    BlocProvider.of<UnitconversionBloc>(context).add(Unit1(widget.items[1]));
    BlocProvider.of<UnitconversionBloc>(context).add(Unitconversion('AC'));
  }

  @override
  Widget build(BuildContext context) {
//-------------------Getting the width of the phone screen----------------------
    var width = MediaQuery.of(context).size.width;
//==============================================================================
    return Scaffold(
//------------ App Bar ---------------------------------------------------------

      appBar: appbarwidget(
        context: context,
        titel: widget.titel,
      ),

//----------Area Screen body ---------------------------------------------------
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                border: Border.all(
                                    width: 0.6,
                                    color: Theme.of(context).primaryColor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  bottomshet(
                                      context, widget.items, controller, 0);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.brightorange),
                                      borderRadius:
                                          BorderRadius.circular(1000)),
                                  child: BlocBuilder<UnitconversionBloc,
                                      IUnitconversionState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AutoSizeText(
                                          state is UnitconversionState
                                              ? state.unit.parameter
                                              : '',
                                          minFontSize: 5,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: BlocBuilder<UnitconversionBloc,
                              IUnitconversionState>(builder: (context, state) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    state is UnitconversionState
                                        ? state.value
                                        : text,
                                    minFontSize: 5,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                AutoSizeText(
                                    state is UnitconversionState
                                        ? '${state.unit.unit}  '
                                        : '',
                                    minFontSize: 5,
                                    textDirection: TextDirection.rtl,
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                              ],
                            );
                          })),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                border: Border.all(
                                    width: 0.6,
                                    color: Theme.of(context).primaryColor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  bottomshet(
                                      context, widget.items, controller1, 1);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.brightorange),
                                      borderRadius:
                                          BorderRadius.circular(1000)),
                                  child: BlocBuilder<UnitconversionBloc,
                                      IUnitconversionState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AutoSizeText(
                                          state is UnitconversionState
                                              ? state.unit1.parameter
                                              : '',
                                          minFontSize: 5,
                                          textDirection: TextDirection.ltr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.end,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<UnitconversionBloc,
                                IUnitconversionState>(
                              builder: (context, state) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: AutoSizeText(
                                        state is UnitconversionState
                                            ? state.result
                                            : text,
                                        minFontSize: 5,
                                        textDirection: TextDirection.ltr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    AutoSizeText(
                                        state is UnitconversionState
                                            ? '${state.unit1.unit}  '
                                            : '',
                                        minFontSize: 5,
                                        textAlign: TextAlign.end,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const Buttons(),
            ),
          )
        ],
      )),
    );
  }

//---------------- ads ---------------------------------------------------------

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
//------------------------------------------------------------------------------
}

//---------------- button widget -----------------------------------------------
class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: width / 1.3,
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
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '8',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '9',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Clikbutton(
                      ButtonModel(
                        titel: '4',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '5',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '6',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Clikbutton(
                      ButtonModel(
                        titel: '1',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '2',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '3',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Clikbutton(
                      ButtonModel(
                        titel: '00',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '0',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '.',
                        titelcolor: Colors.white,
                        bottomcolor: Theme.of(context).canvasColor,
                      ),
                    ),
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
                titelcolor: Theme.of(context).primaryColorLight,
                bottomcolor: Theme.of(context).primaryColorDark,
              ),
            ),
            Clikbutton(
              ButtonModel(
                titel: 'CE',
                titelcolor: Theme.of(context).primaryColorLight,
                bottomcolor: Theme.of(context).primaryColorDark,
              ),
            ),
            Clikbutton(
              ButtonModel(
                titel: '⇌',
                titelcolor: Colors.white,
                bottomcolor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}

//---------------- Clicking buttons -----------------------------------------
class Clikbutton extends StatelessWidget {
  Clikbutton(this.model, {super.key});
  ButtonModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (BlocProvider.of<UnitconversionBloc>(context).amount.contains('.') ==
            true) {
          if (BlocProvider.of<UnitconversionBloc>(context)
                  .amount
                  .substring(BlocProvider.of<UnitconversionBloc>(context)
                      .amount
                      .indexOf('.'))
                  .length <=
              10) {
            BlocProvider.of<UnitconversionBloc>(context).add(Unitconversion(
              model.titel,
            ));
          } else if (BlocProvider.of<UnitconversionBloc>(context)
                      .amount
                      .substring(BlocProvider.of<UnitconversionBloc>(context)
                          .amount
                          .indexOf('.'))
                      .length >
                  10 &&
              model.titel != 'CE' &&
              model.titel != 'AC' &&
              model.titel != '⇌') {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackbarMessage.decimalpointmessage);
          } else {
            BlocProvider.of<UnitconversionBloc>(context).add(Unitconversion(
              model.titel,
            ));
          }
        } else {
          if (model.titel == '.') {
            BlocProvider.of<UnitconversionBloc>(context).add(Unitconversion(
              model.titel,
            ));
          } else {
            if (BlocProvider.of<UnitconversionBloc>(context).amount.length <
                15) {
              BlocProvider.of<UnitconversionBloc>(context).add(Unitconversion(
                model.titel,
              ));
            } else if (BlocProvider.of<UnitconversionBloc>(context)
                        .amount
                        .length >=
                    15 &&
                model.titel != 'CE' &&
                model.titel != 'AC' &&
                model.titel != '⇌') {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackbarMessage.message);
            } else {
              BlocProvider.of<UnitconversionBloc>(context).add(Unitconversion(
                model.titel,
              ));
            }
          }
        }
      },
      child: Bottom(property: model),
    );
  }
}
//------------------------------------------------------------------------------

Future<Widget?> bottomshet(BuildContext context, List<Capabilities> item,
    DraggableScrollableController controller, int number) {
  return showModalBottomSheet(
    isScrollControlled: true,
    barrierColor: Colors.transparent,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: DraggableScrollableSheet(
          controller: controller,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          initialChildSize: 0.6,
          expand: false,
          snap: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.5, bottom: 12.5),
                        child: Text('Select unit',
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30, top: 20, left: 15),
                            child: GestureDetector(
                                onTap: () {
                                  if (number == 0) {
                                    BlocProvider.of<UnitconversionBloc>(context)
                                        .add(Unit(item[index]));
                                  } else if (number == 1) {
                                    BlocProvider.of<UnitconversionBloc>(context)
                                        .add(Unit1(item[index]));
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  '${item[index].parameter}  (${item[index].unit})',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
