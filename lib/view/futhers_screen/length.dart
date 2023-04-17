import 'package:calculator/bloc/length/length_bloc.dart';
import 'package:calculator/bloc/length/length_event.dart';
import 'package:calculator/bloc/length/length_state.dart';
import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:calculator/model/capabilities.dart';
import 'package:calculator/widgets/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/local/length_local_api.dart';
import '../../widgets/appbar_widget.dart';

class LengthScreen extends StatefulWidget {
  const LengthScreen({Key? key}) : super(key: key);

  @override
  State<LengthScreen> createState() => _LengthScreenState();
}

class _LengthScreenState extends State<LengthScreen> {
  //--------------------User input------------------------------------------------
  var setinput = TextEditingController();
//------------------------------------------------------------------------------
  var controller = DraggableScrollableController();
  var controller1 = DraggableScrollableController();
//--------------Getting values ​​from local api-----------------------------------
  var items = LengthApi().getdata();
//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
//-------------------Getting the width of the phone screen----------------------
    var screenw = MediaQuery.of(context).size.width;
//------------------------------------------------------------------------------
    return Scaffold(
      appBar: appbarwidget(
        context: context,
        titel: 'Length',
      ),
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
                                  child: BlocBuilder<LengthBloc, ILengthState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(state is LengthState
                                            ? state.item.parameter
                                            : ''),
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
                          Expanded(child: BlocBuilder<LengthBloc, ILengthState>(
                              builder: (context, state) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state is LengthState ? state.value : '',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: screenw / 15,
                                        color: AppColor.brightorange),
                                  ),
                                ),
                                Text(
                                  state is LengthState
                                      ? '${state.item.unit}  '
                                      : '',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: screenw / 21,
                                  ),
                                ),
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
                                  child: BlocBuilder<LengthBloc, ILengthState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          state is LengthState
                                              ? state.item1.parameter
                                              : '',
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
                          Expanded(child: BlocBuilder<LengthBloc, ILengthState>(
                              builder: (context, state) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state is LengthState
                                        ? state.result.toString()
                                        : '',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: screenw / 15,
                                        color: Colors.grey.shade700),
                                  ),
                                ),
                                Text(
                                  state is LengthState
                                      ? '${state.item1.unit}  '
                                      : '',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: screenw / 21,
                                  ),
                                ),
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
                child: const Keys()),
          )
        ],
      )),
    );
  }
}

class Keys extends StatelessWidget {
  const Keys({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var fontsize = MediaQuery.of(context).size.width / 16;
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
                    Clikbottom(
                      BottomModel(
                        titel: '7',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbottom(
                      BottomModel(
                        titel: '8',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbottom(
                      BottomModel(
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
                    Clikbottom(
                      BottomModel(
                        titel: '4',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbottom(
                      BottomModel(
                        titel: '5',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbottom(
                      BottomModel(
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
                    Clikbottom(
                      BottomModel(
                        titel: '1',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbottom(
                      BottomModel(
                        titel: '2',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbottom(
                      BottomModel(
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
                    Clikbottom(
                      BottomModel(
                        titel: '00',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbottom(
                      BottomModel(
                        titel: '0',
                        titelcolor: Colors.white,
                        bottomcolor: Colors.grey.shade800,
                      ),
                    ),
                    Clikbottom(
                      BottomModel(
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
            Clikbottom(
              BottomModel(
                titel: 'AC',
                titelcolor: AppColor.brightorange,
                bottomcolor: AppColor.bottomcolor,
              ),
            ),
            Clikbottom(
              BottomModel(
                titel: 'CE',
                titelcolor: AppColor.brightorange,
                bottomcolor: AppColor.bottomcolor,
              ),
            ),
            Clikbottom(
              BottomModel(
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

class Clikbottom extends StatelessWidget {
  Clikbottom(this.model, {super.key});
  BottomModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<LengthBloc>(context).add(LengthEvent(
          model.titel,
        ));
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 12.5, bottom: 12.5),
                        child: Text(
                          'Select unit',
                          style: TextStyle(fontSize: 16),
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
                                    BlocProvider.of<LengthBloc>(context)
                                        .add(ItemEvent(item[index]));
                                  } else if (number == 1) {
                                    BlocProvider.of<LengthBloc>(context)
                                        .add(Item1Event(item[index]));
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text(
                                    '${item[index].parameter}  (${item[index].unit})')),
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
