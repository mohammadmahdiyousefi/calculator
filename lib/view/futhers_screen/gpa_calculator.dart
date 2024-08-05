import 'dart:async';
import 'package:adivery/adivery.dart';
import 'package:calculator/bloc/gpa/gpa_bloc.dart';
import 'package:calculator/bloc/gpa/gpa_event.dart';
import 'package:calculator/bloc/gpa/gpa_state.dart';
import 'package:calculator/model/gpa_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/prepare_interstitial_ad.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GpaScreen extends StatefulWidget {
  const GpaScreen({super.key});

  @override
  State<GpaScreen> createState() => _GpaScreenState();
}

class _GpaScreenState extends State<GpaScreen> {
  @override
  void initState() {
    super.initState();
    AdiveryPlugin.prepareInterstitialAd('b27de982-c95c-4adf-b865-0b3720e32517');
    showInterstitial();
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localText = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbarwidget(context: context, titel: localText.gpa),
      body: BlocBuilder<GpaBloc, GpaState>(builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            localText.yourgpa,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            state is GpaStateComplet
                                ? state.grade.toStringAsFixed(2)
                                : "0",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 40),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            localText.unitsTotal,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(
                                state is GpaStateComplet
                                    ? state.unitstotal.toString()
                                    : "0",
                                style:
                                    Theme.of(context).textTheme.displayMedium)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                openAddiolog(
                    context,
                    GPA(
                      localText.coursename,
                      0,
                      0,
                    ),
                    localText);
              },
              child: Container(
                height: 45,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(localText.newCourse,
                      style: Theme.of(context).textTheme.labelMedium),
                ),
              ),
            ),
            Expanded(
                child: (state is GpaStateComplet)
                    ? ListView.builder(
                        itemCount: state.gpas.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: SizedBox(
                              height: 175,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              state.gpas[index].coursename,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(fontSize: 18),
                                            ),
                                          ),
                                          const Divider(
                                            height: 0,
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        localText.grade,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium,
                                                      ),
                                                      const Gap(6),
                                                      Text(
                                                        state.gpas[index].grade
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                              fontSize: 24,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        localText.unit,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium,
                                                      ),
                                                      const Gap(6),
                                                      Text(
                                                        state
                                                            .gpas[index].credits
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium!
                                                            .copyWith(
                                                                fontSize: 24),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await openEditdiolog(
                                                context,
                                                state.gpas[index],
                                                index,
                                                localText);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Theme.of(context).cardColor,
                                              elevation: 0,
                                              shadowColor: Theme.of(context)
                                                  .primaryColor,
                                              surfaceTintColor:
                                                  Theme.of(context)
                                                      .primaryColor,
                                              foregroundColor: Theme.of(context)
                                                  .primaryColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.edit,
                                                color: Colors.blue,
                                                size: 20,
                                              ),
                                              const Gap(6),
                                              Text(
                                                localText.edit,
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Gap(16),
                                      Expanded(
                                          child: ElevatedButton(
                                        onPressed: () async {
                                          BlocProvider.of<GpaBloc>(context).add(
                                              DeletGpaEvent(state.gpas[index]));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Theme.of(context).cardColor,
                                            elevation: 0,
                                            shadowColor:
                                                Theme.of(context).primaryColor,
                                            surfaceTintColor:
                                                Theme.of(context).primaryColor,
                                            foregroundColor:
                                                Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 20,
                                            ),
                                            const Gap(6),
                                            Text(
                                              localText.delete,
                                              style: const TextStyle(
                                                color: Colors.red,
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox()),
          ],
        );
      }),
    );
  }

  Future openEditdiolog(
      BuildContext ctx, GPA gpa, int index, AppLocalizations localText) {
    TextEditingController course = TextEditingController(text: gpa.coursename);
    TextEditingController credits =
        TextEditingController(text: gpa.credits.toString());
    TextEditingController grade =
        TextEditingController(text: gpa.grade.toString());

    return showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          actionsPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(16),
          buttonPadding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Theme.of(context).cardColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: course,
                cursorColor: Theme.of(context).primaryColor,
                style: Theme.of(context).textTheme.labelMedium,
                decoration: InputDecoration(
                    labelText: localText.coursename,
                    labelStyle: Theme.of(context).textTheme.labelMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    )),
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: credits,
                      cursorColor: Theme.of(context).primaryColor,
                      style: Theme.of(context).textTheme.labelMedium,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: localText.unit,
                          labelStyle: Theme.of(context).textTheme.labelMedium,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          )),
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: TextField(
                      controller: grade,
                      cursorColor: Theme.of(context).primaryColor,
                      style: Theme.of(context).textTheme.labelMedium,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: localText.grade,
                          labelStyle: Theme.of(context).textTheme.labelMedium,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                localText.cancel,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<GpaBloc>(ctx).add(
                  EditGpaEvent(
                    gpa,
                    GPA(
                      course.text,
                      int.parse(credits.text),
                      double.parse(grade.text),
                    ),
                    index,
                  ),
                );
                Navigator.pop(context);
              },
              child: Text(
                localText.edit,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        );
      },
    );
  }

  Future openAddiolog(BuildContext ctx, GPA gpa, AppLocalizations localText) {
    TextEditingController course = TextEditingController(text: gpa.coursename);
    TextEditingController credits =
        TextEditingController(text: gpa.credits.toString());
    TextEditingController grade =
        TextEditingController(text: gpa.grade.toString());
    return showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          actionsPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(16),
          buttonPadding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Theme.of(context).cardColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: course,
                cursorColor: Theme.of(context).primaryColor,
                style: Theme.of(context).textTheme.labelMedium,
                decoration: InputDecoration(
                    labelText: localText.coursename,
                    labelStyle: Theme.of(context).textTheme.labelMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    )),
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: credits,
                      cursorColor: Theme.of(context).primaryColor,
                      style: Theme.of(context).textTheme.labelMedium,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: localText.unit,
                          labelStyle: Theme.of(context).textTheme.labelMedium,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          )),
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: TextField(
                      controller: grade,
                      cursorColor: Theme.of(context).primaryColor,
                      style: Theme.of(context).textTheme.labelMedium,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: localText.grade,
                          labelStyle: Theme.of(context).textTheme.labelMedium,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                localText.cancel,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<GpaBloc>(ctx).add(
                  AddGpaEvent(
                    GPA(
                      course.text,
                      int.parse(credits.text),
                      double.parse(grade.text),
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              child: Text(
                localText.add,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            )
          ],
        );
      },
    );
  }
}
