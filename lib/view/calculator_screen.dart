import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/calculator/calculator_state.dart';
import '../constanc/app_colors.dart';
import '../widgets/calculator_bottoms.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
//--------------- get screen width ---------------------------------------------
    var screenw = MediaQuery.of(context).size.width;
//------------------------------------------------------------------------------
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
//---------------- show inputuser and result -----------------------------------
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
//----------------------------- show inputuser text --------------------------//
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 7,
                            child: state is CalculatorState
                                ? AutoSizeText(
                                    state.calculate,
                                    textAlign: TextAlign.end,
                                    minFontSize: 15,
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .longestSide /
                                            25,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  )
                                // SelectableText(
                                //     state.calculate,
                                //     textAlign: TextAlign.end,
                                //     style: GoogleFonts.lato(
                                //         fontSize: MediaQuery.of(context)
                                //                 .size
                                //                 .longestSide /
                                //             25,
                                //         fontStyle: FontStyle.normal,
                                //         fontWeight: FontWeight.w400,
                                //         color: Theme.of(context)
                                //             .unselectedWidgetColor),
                                //   )
                                : Text('error',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                          ),
                        ),
//----------------------------------------------------------------------------//
//----------------------- separate result of inputuser -------------------------
                        Divider(
                          height: 1,
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
//------------------------------------------------------------------------------
//-------------------------- result text -------------------------------------//
                        SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 7,
                            child: state is CalculatorState
                                ? AutoSizeText(
                                    state.result,
                                    minFontSize: 15,
                                    style: GoogleFonts.lato(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .longestSide /
                                            20,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.costumembrightgrey),
                                    textAlign: TextAlign.end,
                                  )
                                //  SelectableText(
                                //     state.result,

                                //     style: GoogleFonts.lato(
                                //         fontSize: state.result.length > 15
                                //             ? MediaQuery.of(context)
                                //                     .size
                                //                     .longestSide /
                                //                 20
                                //             : MediaQuery.of(context)
                                //                     .size
                                //                     .longestSide /
                                //                 16,
                                //         fontStyle: FontStyle.normal,
                                //         fontWeight: FontWeight.w400,
                                //         color: AppColor.costumembrightgrey),
                                //     textAlign: TextAlign.end,
                                //   )
                                : Text(
                                    'error',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    textAlign: TextAlign.end,
                                  ),
                          ),
                        ),
//----------------------------------------------------------------------------//
                      ]),
                );
              }),
            ),
          ),

          ///------------------- show calculator buttons ------------------------------///
          Expanded(
            flex: 16,
            child: Container(
              width: screenw,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const KeyPad(),
            ),
          ),

          ///--------------------------------------------------------------------------///
        ],
      )),
    );
  }
}
