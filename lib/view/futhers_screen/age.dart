import 'package:adivery/adivery.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/bloc/age/age_bloc.dart';
import 'package:calculator/bloc/age/age_event.dart';
import 'package:calculator/bloc/age/age_state.dart';
import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
//----------------- calender metod ---------------------------------------------
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: BlocProvider.of<AgeBloc>(context).birthday,
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              textTheme: TextTheme(
                  headlineSmall: GoogleFonts.lato(), // Selected Date landscape
                  titleLarge: GoogleFonts.lato(), // Selected Date portrait
                  labelSmall: GoogleFonts.lato(), // Title - SELECT DATE
                  titleMedium: GoogleFonts.lato(color: Colors.black), // input
                  titleSmall: GoogleFonts.lato(), // month/year picker
                  bodySmall: GoogleFonts.lato(), // days
                  bodyLarge: GoogleFonts.lato()),
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    // Title, selected date and day selection background (dark and light mode)
                    surface: AppColor.brightorange,
                    primary: AppColor.brightorange,
                    // Title, selected date and month/year picker color (dark and light mode)
                    onSurface: Colors.black,
                    onPrimary: Colors.black,
                  ),
            ),
            child: child!);
      },
    ).then(
        (value) => {BlocProvider.of<AgeBloc>(context).add(AgeEvent(value!))});
  }

//------------------------------------------------------------------------------
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showInterstitial();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appbarwidget(context: context, titel: 'Age'),
        body: Column(
          children: [
            ///--------------------- today date -----------------------------------------///
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 29, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      'Today',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    BlocBuilder<AgeBloc, IAgeState>(builder: (context, state) {
                      return Column(
                        children: [
                          Text(
                            state is AgeState
                                ? '${state.curentdate.month},${state.curentdate.day},${state.curentdate.year} '
                                : 'date',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      );
                    }),
                  ],
                )),

            ///--------------------------------------------------------------------------///
            ///--------------------- date of birth --------------------------------------///
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 5, top: 5, bottom: 100),
              child: Row(
                children: [
                  Text(
                    'Date of birth',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _showDatePicker();
                    },
                    child: SizedBox(
                      child: BlocBuilder<AgeBloc, IAgeState>(
                          builder: (context, state) {
                        return Row(
                          children: [
                            Text(
                              state is AgeState
                                  ? '${state.birthdate.month},${state.birthdate.day},${state.birthdate.year} '
                                  : 'date',
                              style: GoogleFonts.lato(
                                  fontSize: 21,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Theme.of(context).unselectedWidgetColor,
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            ///--------------------------------------------------------------------------///
//------------------------ show detales view ---------------------------------//
            BlocBuilder<AgeBloc, IAgeState>(builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.shortestSide *
                                      0.03),
                              color: Theme.of(context).cardColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Text(
                                    'Age',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            12,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Text(
                                    state is AgeState
                                        ? '${state.age.years}'
                                        : '',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            8,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.orange),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Text(
                                    'years',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            29,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state is AgeState
                                        ? '${state.age.months}'
                                        : '',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            33,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Month | ',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            33,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                  Text(
                                    state is AgeState
                                        ? '${state.age.days}'
                                        : '',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            33,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Day',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            33,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.shortestSide *
                                      0.03),
                              color: Theme.of(context).cardColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AutoSizeText(
                                'Next birthday ',
                                minFontSize: 5,
                                style: GoogleFonts.lato(
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .shortestSide /
                                        22,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.orange),
                              ),
                              Icon(
                                Icons.cake_outlined,
                                color: Colors.orange,
                                size: MediaQuery.of(context).size.longestSide *
                                    0.06,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state is AgeState
                                        ? '${state.nextbirthday.months}'
                                        : '',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            33,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Month | ',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            33,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                  Text(
                                    state is AgeState
                                        ? '${state.nextbirthday.days}'
                                        : '',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            33,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Day',
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide /
                                            33,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.shortestSide * 0.03),
                          color: Theme.of(context).cardColor),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'Summary',
                                minFontSize: 5,
                                style: GoogleFonts.lato(
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .shortestSide /
                                        18,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.orange),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'years',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      Text(
                                        state is AgeState ? state.year : '',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Text(
                                        'Days',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      Text(
                                        state is AgeState ? state.day : '',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Month',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      Text(
                                        state is AgeState ? state.months : '',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Text(
                                        'Hours',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      Text(
                                        state is AgeState ? state.hour : '',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Week',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      Text(
                                        state is AgeState ? state.week : '',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Text(
                                        'Minutes',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      Text(
                                        state is AgeState ? state.minuts : '',
                                        style: GoogleFonts.lato(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide /
                                                33,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
//----------------------------------------------------------------------------//
          ],
        ));
  }
  //---------------- ads -------------------------------------------------------

//------------------------------------------------------------------------------
}
