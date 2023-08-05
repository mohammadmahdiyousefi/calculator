import 'package:adivery/adivery.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/bloc/gap/gap_bloc.dart';
import 'package:calculator/bloc/gap/gap_event.dart';
import 'package:calculator/bloc/gap/gap_state.dart';
import 'package:calculator/model/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/appbar_widget.dart';

class AvrageScreen extends StatefulWidget {
  const AvrageScreen({super.key});

  @override
  State<AvrageScreen> createState() => _AvrageScreenState();
}

class _AvrageScreenState extends State<AvrageScreen> {
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: SizedBox(
        height: height * 0.065,
        width: width * 0.13,
        child: FloatingActionButton(
          onPressed: () {
            openAddiolog(context, Gap("course", 0, 0, 0));
          },
          backgroundColor: Colors.orange,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: MediaQuery.of(context).size.shortestSide * 0.1,
          ),
        ),
      ),
      appBar: appbarwidget(context: context, titel: 'GPA'),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: width * 0.3,
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: AutoSizeText(
                  "Course",
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
              ),
              Container(
                height: 50,
                width: width * 0.14,
                margin: EdgeInsets.symmetric(horizontal: width * 0.036),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: AutoSizeText(
                  "Credits",
                  minFontSize: 5,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
              ),
              Container(
                  height: 50,
                  width: width * 0.12,
                  margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: AutoSizeText(
                    "Max Grade",
                    minFontSize: 5,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ))),
              Container(
                  height: 50,
                  width: width * 0.12,
                  margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: AutoSizeText(
                    "Min Grade",
                    minFontSize: 5,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ))),
            ],
          ),
          Expanded(
            child: BlocBuilder<GapBloc, IGapState>(builder: (context, state) {
              if (state is GapState) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: height,
                      width: width,
                      child: ListView.builder(
                        itemCount: state.gaps.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              openEditdiolog(context, state.gaps[index], index);
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.3,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.04, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: AutoSizeText(
                                    state.gaps[index].course,
                                    minFontSize: 5,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )),
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.13,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.042, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: AutoSizeText(
                                    state.gaps[index].credits.toString(),
                                    minFontSize: 5,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )),
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.12,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.04, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: AutoSizeText(
                                    state.gaps[index].maxgrade.toString(),
                                    minFontSize: 5,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        fontSize: 13,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red),
                                  )),
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.12,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.04, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: AutoSizeText(
                                    state.gaps[index].mingrade.toString(),
                                    minFontSize: 5,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        fontSize: 13,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                                  )),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Visibility(
                        visible: state.gaps.isEmpty ? false : true,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(width * 0.1, height * 0.05),
                                backgroundColor: Colors.orange),
                            onPressed: () async {
                              BlocProvider.of<GapBloc>(context)
                                  .add(CalculatGapEvent());
                              await resultdiolog(context, state.max, state.min);
                            },
                            child: AutoSizeText(
                              "Calculat",
                              minFontSize: 5,
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                      ),
                    )
                  ],
                );
              } else {
                return Container();
              }
            }),
          ),
        ],
      )),
    );
  }

  Future openEditdiolog(BuildContext context, Gap gap, int index) {
    TextEditingController Course = TextEditingController(text: gap.course);
    TextEditingController Credits =
        TextEditingController(text: gap.credits.toString());
    TextEditingController MaxGrade =
        TextEditingController(text: gap.maxgrade.toString());
    TextEditingController MinGrade =
        TextEditingController(text: gap.mingrade.toString());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Center(
              child: Text(
            'Edit',
            style: Theme.of(context).textTheme.labelSmall,
          )),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: SizedBox(
              height: height * 0.5,
              width: width * 0.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextField(
                        controller: Course,
                        style: Theme.of(context).textTheme.labelMedium,
                        decoration: InputDecoration(
                            labelText: "Course",
                            labelStyle: GoogleFonts.lato(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: Theme.of(context).textTheme.labelMedium,
                        controller: Credits,
                        decoration: InputDecoration(
                            labelText: "Credits",
                            labelStyle: GoogleFonts.lato(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextField(
                        controller: MaxGrade,
                        style: Theme.of(context).textTheme.labelMedium,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Max Grade",
                            labelStyle: GoogleFonts.lato(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: Theme.of(context).textTheme.labelMedium,
                        controller: MinGrade,
                        decoration: InputDecoration(
                            labelText: "Min Grade",
                            labelStyle: GoogleFonts.lato(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      Size(width * 0.01, height * 0.05),
                                  backgroundColor: Colors.orange),
                              onPressed: () {
                                BlocProvider.of<GapBloc>(context)
                                    .add(DeletGapEvent(gap));
                                Navigator.pop(context);
                              },
                              child: AutoSizeText(
                                "Delet",
                                minFontSize: 5,
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      Size(width * 0.01, height * 0.05),
                                  backgroundColor: Colors.orange),
                              onPressed: () {
                                BlocProvider.of<GapBloc>(context)
                                    .add(EditGapEvent(
                                        gap,
                                        Gap(
                                          Course.text,
                                          int.parse(Credits.text),
                                          double.parse(MaxGrade.text),
                                          double.parse(MinGrade.text),
                                        ),
                                        index));
                                Navigator.pop(context);
                              },
                              child: AutoSizeText(
                                "Edit",
                                minFontSize: 5,
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  Future openAddiolog(BuildContext context, Gap gap) {
    TextEditingController Course = TextEditingController(text: gap.course);
    TextEditingController Credits =
        TextEditingController(text: gap.credits.toString());
    TextEditingController MaxGrade =
        TextEditingController(text: gap.maxgrade.toString());
    TextEditingController MinGrade =
        TextEditingController(text: gap.mingrade.toString());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Center(
              child: Text(
            'Add',
            style: Theme.of(context).textTheme.labelSmall,
          )),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: SizedBox(
              height: height * 0.5,
              width: width * 0.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextField(
                        controller: Course,
                        style: Theme.of(context).textTheme.labelMedium,
                        decoration: InputDecoration(
                            labelText: "Course",
                            labelStyle: GoogleFonts.lato(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextField(
                        controller: Credits,
                        style: Theme.of(context).textTheme.labelMedium,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Credits",
                            labelStyle: GoogleFonts.lato(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextField(
                        controller: MaxGrade,
                        style: Theme.of(context).textTheme.labelMedium,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Max Grade",
                            labelStyle: GoogleFonts.lato(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextField(
                        controller: MinGrade,
                        style: Theme.of(context).textTheme.labelMedium,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Min Grade",
                            labelStyle: GoogleFonts.lato(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      Size(width * 0.01, height * 0.05),
                                  backgroundColor: Colors.orange),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: AutoSizeText(
                                  "Cancel",
                                  minFontSize: 5,
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      Size(width * 0.01, height * 0.05),
                                  backgroundColor: Colors.orange),
                              onPressed: () {
                                BlocProvider.of<GapBloc>(context).add(
                                    AddGapEvent(Gap(
                                        Course.text,
                                        int.parse(Credits.text),
                                        double.parse(MaxGrade.text),
                                        double.parse(MinGrade.text))));
                                Navigator.pop(context);
                              },
                              child: AutoSizeText(
                                "Add",
                                minFontSize: 5,
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  Future resultdiolog(
    BuildContext context,
    double max,
    double min,
  ) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (context) {
        return BlocBuilder<GapBloc, IGapState>(builder: (context, state) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Center(
                child: Text(
              'Result',
              style: Theme.of(context).textTheme.bodySmall,
            )),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: SizedBox(
                height: height * 0.2,
                width: width * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        "Max Grade",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                    ),
                    Text(
                      state is GapState ? state.max.toStringAsFixed(2) : "0",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Center(
                      child: Text(
                        "Min Grade",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                    ),
                    Text(
                      state is GapState ? state.min.toStringAsFixed(2) : "0",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                )),
          );
        });
      },
    );
  }
}
