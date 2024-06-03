import 'dart:async';
import 'package:adivery/adivery.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/bloc/unitconversion/from_state.dart';
import 'package:calculator/bloc/unitconversion/input_state.dart';
import 'package:calculator/bloc/unitconversion/result_state.dart';
import 'package:calculator/bloc/unitconversion/to_state.dart';
import 'package:calculator/bloc/unitconversion/unitconversion_event.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:calculator/model/capabilities.dart';
import 'package:calculator/widgets/appbar_widget.dart';
import 'package:calculator/widgets/bottom.dart';
import 'package:calculator/widgets/prepare_interstitial_ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/unitconversion/unitconversion_bloc.dart';
import '../../bloc/unitconversion/unitconversion_state.dart';

class ConversionScreen extends StatefulWidget {
  const ConversionScreen(this.items, this.titel, {super.key});
  final List<Capabilities> items;
  final String titel;
  @override
  State<ConversionScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    AdiveryPlugin.prepareInterstitialAd('b27de982-c95c-4adf-b865-0b3720e32517');
    showInterstitial();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnitconversionBloc, UnitconversionState>(
      builder: (context, state) {
        return Scaffold(
          //------------ App Bar ---------------------------------------------------------

          appBar: appbarwidget(
            context: context,
            titel: widget.titel,
          ),

          //----------Area Screen body ---------------------------------------------------
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Gap(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _frombottomsheet(
                                      context,
                                      widget.items,
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 16, right: 8),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(9))),
                                    child:
                                        _fromBottomSheet(context, state.from),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _tobottomsheet(context, widget.items);
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          left: 16,
                                          right: 8),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(9))),
                                      child: _toBottomSheet(context, state.to)),
                                ),
                              ),
                            ],
                          ),
                          const Gap(25),
                          const Divider(
                            indent: 16,
                            endIndent: 16,
                          ),
                          _fromUnit(context, state.from),
                          Expanded(child: _inputuser(context, state.input)),
                          const Divider(
                            indent: 16,
                            endIndent: 16,
                          ),
                          _toUnit(context, state.to),
                          Expanded(child: _result(context, state.result)),
                          const Divider(
                            indent: 16,
                            endIndent: 16,
                          ),
                          const Gap(25),
                        ]),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: const Buttons(),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _fromBottomSheet(BuildContext context, FromState statefrom) {
    return Row(
      children: [
        Expanded(
          child: AutoSizeText(
            statefrom is FromStateUnit
                ? statefrom.unit.parameter
                : "Select Unit",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.ltr,
            minFontSize: 5,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const Icon(Icons.keyboard_arrow_down)
      ],
    );
  }

  Widget _fromUnit(BuildContext context, FromState statefrom) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: AutoSizeText(
          statefrom is FromStateUnit ? statefrom.unit.convertunit : '',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          minFontSize: 5,
          textDirection: TextDirection.ltr,
          style: Theme.of(context).textTheme.labelMedium),
    );
  }

  Widget _toUnit(BuildContext context, ToState stateto) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: AutoSizeText(
          stateto is ToStateUnit ? stateto.unit.convertunit : '',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          minFontSize: 5,
          textDirection: TextDirection.ltr,
          style: Theme.of(context).textTheme.labelMedium),
    );
  }

  Widget _toBottomSheet(BuildContext context, ToState stateto) {
    return Row(
      children: [
        Expanded(
          child: AutoSizeText(
            stateto is ToStateUnit ? stateto.unit.parameter : "Select Unit",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            minFontSize: 5,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const Icon(Icons.keyboard_arrow_down)
      ],
    );
  }

  Widget _inputuser(BuildContext context, InputState stateinput) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: AutoSizeText(
        stateinput is InputStateUser ? stateinput.input : "",
        minFontSize: 5,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget _result(BuildContext context, ResultState stateResult) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: AutoSizeText(
        stateResult is ResultStateResult ? "${stateResult.result}" : "",
        minFontSize: 5,
        textDirection: TextDirection.ltr,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.end,
      ),
    );
  }

  Future<Widget?> _frombottomsheet(
    BuildContext ctx,
    List<Capabilities> item,
  ) {
    return showModalBottomSheet(
      isScrollControlled: false,
      barrierColor: Colors.transparent,
      backgroundColor: Theme.of(ctx).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      context: ctx,
      builder: (context) {
        return Column(
          children: [
            Divider(
              indent: MediaQuery.of(context).size.width * 0.4,
              endIndent: MediaQuery.of(context).size.width * 0.4,
              height: 20,
              thickness: 3,
            ),
            const Gap(6),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onTap: () {
                        BlocProvider.of<UnitconversionBloc>(ctx)
                            .add(FromUnit(item[index]));
                        Navigator.pop(context);
                      },
                      title: Text(
                        item[index].parameter,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: Text(
                        item[index].convertunit,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.grey),
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }

  Future<Widget?> _tobottomsheet(
    BuildContext ctx,
    List<Capabilities> item,
  ) {
    return showModalBottomSheet(
      isScrollControlled: false,
      barrierColor: Colors.transparent,
      backgroundColor: Theme.of(ctx).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      context: ctx,
      builder: (context) {
        return Column(
          children: [
            Divider(
              indent: MediaQuery.of(context).size.width * 0.4,
              endIndent: MediaQuery.of(context).size.width * 0.4,
              height: 20,
              thickness: 3,
            ),
            const Gap(6),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onTap: () {
                        BlocProvider.of<UnitconversionBloc>(ctx)
                            .add(ToUnit(item[index]));

                        Navigator.pop(context);
                      },
                      title: Text(
                        item[index].parameter,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: Text(item[index].convertunit,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.grey)),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}

//---------------- button widget -----------------------------------------------
class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      titel: '⇌',
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

  //---------------- Clicking buttons -----------------------------------------
  Widget clikbutton(BuildContext context, ButtonModel model) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<UnitconversionBloc>(context).add(Unitconversion(
          model.titel,
        ));
      },
      child: Bottom(property: model),
    );
  }
//------------------------------------------------------------------------------
}
