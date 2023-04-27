import 'package:adivery/adivery.dart';
import 'package:calculator/bloc/age/age_bloc.dart';
import 'package:calculator/bloc/age/age_event.dart';
import 'package:calculator/bloc/age/age_state.dart';
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
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: BlocProvider.of<AgeBloc>(context).birthday,
      firstDate: DateTime(1930),
      lastDate: DateTime(2096),
    ).then(
        (value) => {BlocProvider.of<AgeBloc>(context).add(AgeEvent(value!))});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showInterstitial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appbarwidget(context: context, titel: 'Age'),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 28, top: 10, bottom: 10),
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
                            const Icon(Icons.arrow_drop_down),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<AgeBloc, IAgeState>(builder: (context, state) {
              return Card(
                elevation: 2,
                shadowColor: Theme.of(context).unselectedWidgetColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.4,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Age',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      state is AgeState
                                          ? '${state.age.years}'
                                          : '',
                                      style: GoogleFonts.lato(
                                          fontSize: 50,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.orange),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'years',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state is AgeState
                                          ? '${state.age.months}'
                                          : '',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Month | ',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Text(
                                      state is AgeState
                                          ? '${state.age.days}'
                                          : '',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Day',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: 1,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Next birthday ',
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Icon(
                                  Icons.cake_outlined,
                                  color: Colors.orange,
                                  size: 50,
                                ),
                                const SizedBox(
                                  height: 28,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state is AgeState
                                          ? '${state.nextbirthday.months}'
                                          : '',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Month | ',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Text(
                                      state is AgeState
                                          ? '${state.nextbirthday.days}'
                                          : '',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Day',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        height: 0,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Summary',
                            style: GoogleFonts.lato(
                                fontSize: 26,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'years',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    state is AgeState ? state.year : '',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Days',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    state is AgeState ? state.day : '',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Month',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    state is AgeState ? state.months : '',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Hours',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    state is AgeState ? state.hour : '',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Week',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    state is AgeState ? state.week : '',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Minutes',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    state is AgeState ? state.minuts : '',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
              );
            }),
          ],
        ));
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
