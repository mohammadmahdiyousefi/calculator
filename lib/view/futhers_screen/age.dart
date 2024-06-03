import 'dart:async';
import 'package:adivery/adivery.dart';
import 'package:adivery/adivery_ads.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/bloc/age/age_bloc.dart';
import 'package:calculator/bloc/age/age_event.dart';
import 'package:calculator/bloc/age/age_state.dart';
import 'package:calculator/bloc/age/from_state.dart';
import 'package:calculator/bloc/age/result_state.dart';
import 'package:calculator/bloc/age/to_state.dart';
import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/widgets/appbar_widget.dart';
import 'package:calculator/widgets/banner_ads.dart';
import 'package:calculator/widgets/prepare_interstitial_ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  @override
  void initState() {
    super.initState();
    AdiveryPlugin.prepareInterstitialAd('b27de982-c95c-4adf-b865-0b3720e32517');
    showInterstitial();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgeBloc, AgeState>(builder: (context, state) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appbarwidget(context: context, titel: 'Age'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(32),
                  _fromField(
                    context: context,
                    state: state.from,
                  ),
                  const Gap(16),
                  _toField(
                    context: context,
                    state: state.to,
                  ),
                  const Gap(24),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AgeBloc>(context)
                            .add(AgeEventCalculate());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.brightorange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          minimumSize: const Size(double.infinity, 50)),
                      child: Text(
                        "calculate",
                        style: Theme.of(context).textTheme.labelMedium,
                      )),
                  const Gap(24),
                  _resultField(context: context, state: state.result),
                  //----------------------------------------------------------------------------//
                ],
              ),
            ),
          ));
    });
  }

  Widget _resultField(
      {required BuildContext context, required ResultState state}) {
    if (state is ResultStateCompleted) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(32),
                Row(
                  children: [
                    Text('Your Age',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 18)),
                  ],
                ),
                const Gap(32),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.age.years.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${state.age.months}',
                              style: Theme.of(context).textTheme.bodySmall),
                          const Gap(8),
                          Text('Month | ',
                              style: Theme.of(context).textTheme.bodySmall),
                          Text('${state.age.days}',
                              style: Theme.of(context).textTheme.bodySmall),
                          const Gap(8),
                          Text('Day',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Container(
            height: 210,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText('Next birthday ',
                          minFontSize: 5,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 18, color: AppColor.brightorange)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.nextbirthday.months.toString(),
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('Month | ',
                              style: Theme.of(context).textTheme.bodySmall),
                          Text(state.nextbirthday.days.toString(),
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('Day',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  AutoSizeText(
                    'Summary',
                    minFontSize: 5,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 18, color: AppColor.brightorange),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText(
                                'Year',
                                minFontSize: 5,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              AutoSizeText(state.diffrence.years.toString(),
                                  minFontSize: 5,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText(
                                'month',
                                minFontSize: 5,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              AutoSizeText(
                                  (state.diffrence.years * 12 +
                                          state.diffrence.months)
                                      .toString(),
                                  minFontSize: 5,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText(
                                'day',
                                minFontSize: 5,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              AutoSizeText(state.summary.inDays.toString(),
                                  minFontSize: 5,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText(
                                'hour',
                                minFontSize: 5,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              AutoSizeText(state.summary.inHours.toString(),
                                  minFontSize: 5,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText(
                                'minuts',
                                minFontSize: 5,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              AutoSizeText((state.summary.inMinutes).toString(),
                                  minFontSize: 5,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText(
                                'seconds',
                                minFontSize: 5,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              AutoSizeText(state.summary.inSeconds.toString(),
                                  minFontSize: 5,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Gap(16),
          creatabannerad(BannerAdSize.LARGE_BANNER) ?? const SizedBox(),
          const Gap(16)
        ],
      );
    } else if (state is ResultStateLoading) {
      return CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      );
    } else if (state is ResultStateError) {
      return Text(state.error.toString());
    } else {
      return const Text("Error");
    }
  }

  Widget _toField({
    required BuildContext context,
    required ToState state,
  }) {
    if (state is ToStateSeted) {
      return GestureDetector(
        onTap: () async {
          await showDatePicker(
            context: context,
            initialDate: state.to,
            firstDate: DateTime(1900),
            lastDate: DateTime(2200),
            builder: (context, child) {
              return Theme(data: datetimepikertheme(), child: child!);
            },
          ).then((value) {
            if (value != null) {
              BlocProvider.of<AgeBloc>(context).add(AgeEventSetTo(value));
            }
          });
        },
        child: Row(
          children: [
            Text(
              'end date',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Expanded(
              child: Text(
                '${state.to.month},${state.to.day},${state.to.year} ',
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ],
        ),
      );
    } else if (state is ToStateLoading) {
      return CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      );
    } else if (state is ToStateError) {
      return GestureDetector(
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2200),
              builder: (context, child) {
                return Theme(data: datetimepikertheme(), child: child!);
              },
            ).then((value) {
              if (value != null) {
                BlocProvider.of<AgeBloc>(context).add(AgeEventSetTo(value));
              }
            });
          },
          child: Text(
            state.error.toString(),
            style: Theme.of(context).textTheme.labelMedium,
          ));
    } else {
      return GestureDetector(
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2200),
              builder: (context, child) {
                return Theme(data: datetimepikertheme(), child: child!);
              },
            ).then((value) {
              if (value != null) {
                BlocProvider.of<AgeBloc>(context).add(AgeEventSetTo(value));
              }
            });
          },
          child: Text(
            'Error',
            style: Theme.of(context).textTheme.labelMedium,
          ));
    }
  }

  Widget _fromField({
    required BuildContext context,
    required FromState state,
  }) {
    if (state is FromStateSeted) {
      return GestureDetector(
        onTap: () async {
          await showDatePicker(
            context: context,
            initialDate: state.from,
            firstDate: DateTime(1900),
            lastDate: DateTime(2200),
            builder: (context, child) {
              return Theme(data: datetimepikertheme(), child: child!);
            },
          ).then((value) {
            if (value != null) {
              BlocProvider.of<AgeBloc>(context).add(AgeEventSetFrom(value));
            }
          });
        },
        child: Row(
          children: [
            Text(
              'start date',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Expanded(
              child: Text(
                '${state.from.month},${state.from.day},${state.from.year} ',
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ],
        ),
      );
    } else if (state is FromStateLoading) {
      return CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      );
    } else if (state is FromStateError) {
      return GestureDetector(
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2200),
              builder: (context, child) {
                return Theme(data: datetimepikertheme(), child: child!);
              },
            ).then((value) {
              if (value != null) {
                BlocProvider.of<AgeBloc>(context).add(AgeEventSetFrom(value));
              }
            });
          },
          child: Text(
            state.error.toString(),
            style: Theme.of(context).textTheme.labelMedium,
          ));
    } else {
      return GestureDetector(
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2200),
              builder: (context, child) {
                return Theme(data: datetimepikertheme(), child: child!);
              },
            ).then((value) {
              if (value != null) {
                BlocProvider.of<AgeBloc>(context).add(AgeEventSetFrom(value));
              }
            });
          },
          child: Text(
            'Error',
            style: Theme.of(context).textTheme.labelMedium,
          ));
    }
  }

  ThemeData datetimepikertheme() {
    return Theme.of(context).copyWith(
      textTheme: TextTheme(
          headlineSmall: GoogleFonts.roboto(),
          titleLarge: GoogleFonts.roboto(),
          labelSmall: GoogleFonts.roboto(),
          titleMedium: GoogleFonts.roboto(), // input
          titleSmall: GoogleFonts.roboto(),
          bodyMedium: GoogleFonts.roboto(),
          displayLarge: GoogleFonts.roboto(),
          displayMedium: GoogleFonts.roboto(),
          displaySmall: GoogleFonts.roboto(),
          bodySmall: GoogleFonts.roboto(),
          bodyLarge: GoogleFonts.roboto()),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            surface: Theme.of(context).cardColor,
            primary: AppColor.customorange,
            surfaceTint: Colors.transparent,
            onSurface: Theme.of(context).unselectedWidgetColor,
            onSurfaceVariant: AppColor.customorange,
          ),
    );
  }
}
