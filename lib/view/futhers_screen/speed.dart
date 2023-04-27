import 'package:adivery/adivery.dart';
import 'package:calculator/bloc/speed/speed_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/speed/speed_bloc.dart';
import '../../bloc/speed/speed_state.dart';
import '../../constanc/app_colors.dart';
import '../../constanc/snackbar_message.dart';
import '../../model/bottom_model.dart';
import '../../model/capabilities.dart';
import '../../service/local/speed_local_api.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/bottom.dart';

class SpeedScreen extends StatefulWidget {
  const SpeedScreen({Key? key}) : super(key: key);

  @override
  State<SpeedScreen> createState() => _SpeedScreenState();
}

class _SpeedScreenState extends State<SpeedScreen> {
//--------------------User input------------------------------------------------
  var setinput = TextEditingController();
//------------------------------------------------------------------------------
  var controller = DraggableScrollableController();
  var controller1 = DraggableScrollableController();
//--------------Getting values ​​from local api-----------------------------------
  var items = SpeedApi().getdata();
//------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    _showInterstitial();
  }

  @override
  Widget build(BuildContext context) {
//-------------------Getting the width of the phone screen----------------------
    var screenw = MediaQuery.of(context).size.width;
    return Scaffold(
//-------------- App Bar -------------------------------------------------------
      appBar: appbarwidget(
        context: context,
        titel: 'Speed',
      ),
//------------  Speed Screen body ----------------------------------------------
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: screenw,
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
                                color: Theme.of(context).primaryColor,
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  bottomshet(context, items, controller, 0);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.brightorange),
                                      borderRadius:
                                          BorderRadius.circular(1000)),
                                  child: BlocBuilder<SpeedBloc, ISpeedState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          state is SpeedState
                                              ? state.item.parameter
                                              : '',
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
                          Expanded(child: BlocBuilder<SpeedBloc, ISpeedState>(
                              builder: (context, state) {
                            return Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    readOnly: true,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.end,
                                    controller: state is SpeedState
                                        ? state.value
                                        : TextEditingController(),
                                    keyboardType: TextInputType.none,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                                Text(
                                    state is SpeedState
                                        ? '${state.item.unit}  '
                                        : '',
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
                                color: Theme.of(context).primaryColor,
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  bottomshet(context, items, controller1, 1);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.brightorange),
                                      borderRadius:
                                          BorderRadius.circular(1000)),
                                  child: BlocBuilder<SpeedBloc, ISpeedState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          state is SpeedState
                                              ? state.item1.parameter
                                              : '',
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
                          Expanded(child: BlocBuilder<SpeedBloc, ISpeedState>(
                              builder: (context, state) {
                            return Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    readOnly: true,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    textAlign: TextAlign.end,
                                    controller: state is SpeedState
                                        ? state.result
                                        : TextEditingController(),
                                    keyboardType: TextInputType.none,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                                Text(
                                    state is SpeedState
                                        ? '${state.item1.unit}  '
                                        : '',
                                    textAlign: TextAlign.end,
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                              ],
                            );
                          })),
                        ],
                      ),
                    ]),
              ),
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
                child: const Buttons()),
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
  });

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
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '8',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '9',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
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
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '5',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '6',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
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
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '2',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '3',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
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
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '0',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbutton(
                      ButtonModel(
                        titel: '.',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
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
                titelcolor: AppColor.brightorange,
                bottomcolor: AppColor.bottomcolor,
              ),
            ),
            Clikbutton(
              ButtonModel(
                titel: 'CE',
                titelcolor: AppColor.brightorange,
                bottomcolor: AppColor.bottomcolor,
              ),
            ),
            Clikbutton(
              ButtonModel(
                titel: '⇌',
                titelcolor: AppColor.bottomtitel,
                bottomcolor: AppColor.customorange,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Clikbutton extends StatelessWidget {
  Clikbutton(this.model, {super.key});
  ButtonModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (BlocProvider.of<SpeedBloc>(context).amount.text.contains('.') ==
            true) {
          if (BlocProvider.of<SpeedBloc>(context)
                  .amount
                  .text
                  .substring(BlocProvider.of<SpeedBloc>(context)
                      .amount
                      .text
                      .indexOf('.'))
                  .length <=
              10) {
            BlocProvider.of<SpeedBloc>(context).add(SpeedEvent(
              model.titel,
            ));
          } else if (BlocProvider.of<SpeedBloc>(context)
                      .amount
                      .text
                      .substring(BlocProvider.of<SpeedBloc>(context)
                          .amount
                          .text
                          .indexOf('.'))
                      .length >
                  10 &&
              model.titel != 'CE' &&
              model.titel != 'AC' &&
              model.titel != '⇌') {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackbarMessage.decimalpointmessage);
          } else {
            BlocProvider.of<SpeedBloc>(context).add(SpeedEvent(
              model.titel,
            ));
          }
        } else {
          if (model.titel == '.') {
            BlocProvider.of<SpeedBloc>(context).add(SpeedEvent(
              model.titel,
            ));
          } else {
            if (BlocProvider.of<SpeedBloc>(context).amount.text.length < 15) {
              BlocProvider.of<SpeedBloc>(context).add(SpeedEvent(
                model.titel,
              ));
            } else if (BlocProvider.of<SpeedBloc>(context).amount.text.length >=
                    15 &&
                model.titel != 'CE' &&
                model.titel != 'AC' &&
                model.titel != '⇌') {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackbarMessage.message);
            } else {
              BlocProvider.of<SpeedBloc>(context).add(SpeedEvent(
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
                color: Theme.of(context).primaryColor,
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
                        child: Text(
                          'Select unit',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
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
                                bottom: 30, top: 20, left: 10),
                            child: GestureDetector(
                                onTap: () {
                                  if (number == 0) {
                                    BlocProvider.of<SpeedBloc>(context)
                                        .add(ItemEvent(item[index]));
                                  } else if (number == 1) {
                                    BlocProvider.of<SpeedBloc>(context)
                                        .add(Item1Event(item[index]));
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
