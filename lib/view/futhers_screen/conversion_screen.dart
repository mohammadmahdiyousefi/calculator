import 'dart:async';
import 'package:adivery/adivery.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/bloc/unitconversion/from_state.dart';
import 'package:calculator/bloc/unitconversion/input_state.dart';
import 'package:calculator/bloc/unitconversion/result_state.dart';
import 'package:calculator/bloc/unitconversion/to_state.dart';
import 'package:calculator/bloc/unitconversion/unitconversion_event.dart';
import 'package:calculator/model/capabilities.dart';
import 'package:calculator/widgets/appbar_widget.dart';
import 'package:calculator/widgets/button.dart';
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
          appBar: appbarwidget(
            context: context,
            titel: widget.titel,
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
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
                                  margin:
                                      const EdgeInsets.only(right: 16, left: 8),
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 16, right: 8),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  child: _fromBottomUnit(state.from),
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
                                    margin: const EdgeInsets.only(
                                        left: 16, right: 8),
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 16, right: 8),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8))),
                                    child: _toBottomUnit(state.to)),
                              ),
                            ),
                          ],
                        ),
                        const Gap(25),
                        _fromUnit(state.from),
                        const Gap(8),
                        Expanded(child: _inputuser(state.input)),
                        _toUnit(state.to),
                        const Gap(8),
                        Expanded(child: _result(state.result)),
                        const Gap(16),
                      ]),
                ),
                Expanded(
                  flex: 1,
                  child: _keypad(),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _fromBottomUnit(FromState statefrom) {
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
            style: Theme.of(context).listTileTheme.titleTextStyle,
          ),
        ),
        const Icon(Icons.keyboard_arrow_down)
      ],
    );
  }

  Widget _fromUnit(FromState statefrom) {
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

  Widget _toUnit(ToState stateto) {
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

  Widget _toBottomUnit(ToState stateto) {
    return Row(
      children: [
        Expanded(
          child: AutoSizeText(
            stateto is ToStateUnit ? stateto.unit.parameter : "Select Unit",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            minFontSize: 5,
            style: Theme.of(context).listTileTheme.titleTextStyle,
          ),
        ),
        const Icon(Icons.keyboard_arrow_down)
      ],
    );
  }

  Widget _inputuser(InputState stateinput) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: AutoSizeText(
        stateinput is InputStateUser ? stateinput.input : "",
        minFontSize: 5,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).primaryColor),
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget _result(ResultState stateResult) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: AutoSizeText(
        stateResult is ResultStateResult ? stateResult.result : "",
        minFontSize: 5,
        textDirection: TextDirection.ltr,
        style: Theme.of(context).textTheme.displayMedium,
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
      elevation: 0,
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
                        style: Theme.of(context).listTileTheme.titleTextStyle,
                      ),
                      trailing: Text(item[index].convertunit,
                          style: Theme.of(context)
                              .listTileTheme
                              .leadingAndTrailingTextStyle),
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
      elevation: 0,
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
                        style: Theme.of(context).listTileTheme.titleTextStyle,
                      ),
                      trailing: Text(item[index].convertunit,
                          style: Theme.of(context)
                              .listTileTheme
                              .leadingAndTrailingTextStyle),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }

  Widget _keypad() {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Column(children: [
            Expanded(child: buildNumberRow('7', '8', '9')),
            Expanded(child: buildNumberRow('4', '5', '6')),
            Expanded(child: buildNumberRow('1', '2', '3')),
            Expanded(child: buildNumberRow('00', '0', '.')),
          ]),
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
                child: Button(
                  icon: const Icon(Icons.sync_alt_sharp,
                      color: Colors.white, size: 34),
                  backgroundColor: Theme.of(context).primaryColor,
                  onTap: () => BlocProvider.of<UnitconversionBloc>(context)
                      .add(UnitconversionChange()),
                ),
              ),
            ],
          ),
        ),
      ],
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
      onTap: () => BlocProvider.of<UnitconversionBloc>(context)
          .add(label == 'AC' ? UnitconversionAC() : UnitconversionCE()),
      onLongPress: () => label == 'CE'
          ? BlocProvider.of<UnitconversionBloc>(context)
              .add(UnitconversionCETimer())
          : null,
      onLongPressEnd: (p0) => label == 'CE'
          ? BlocProvider.of<UnitconversionBloc>(context)
              .add(UnitconversionCETimerCancel())
          : null,
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
      onTap: () => BlocProvider.of<UnitconversionBloc>(context)
          .add(Unitconversion(number)),
    );
  }
}
