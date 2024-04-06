import 'package:age_calculator/age_calculator.dart';
import 'package:calculator/bloc/age/age_state.dart';
import 'package:calculator/bloc/age/from_state.dart';
import 'package:calculator/bloc/age/result_state.dart';
import 'package:calculator/bloc/age/to_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'age_event.dart';

class AgeBloc extends Bloc<AgeEvent, AgeState> {
  DateTime to = DateTime.now();
  DateTime from = DateTime.now();
  DateDuration nextbirthday = DateDuration();
  DateDuration age = DateDuration();
  DateDuration diffrence = DateDuration();
  Duration summary = const Duration();

  AgeBloc()
      : super(AgeState(
            to: ToStateSeted(to: DateTime.now()),
            from: FromStateSeted(from: DateTime.now()),
            result: ResultStateCompleted(
                age: DateDuration(),
                diffrence: DateDuration(),
                nextbirthday: DateDuration(),
                summary: const Duration()))) {
    on<AgeEventSetTo>((event, emit) {
      emit(state.copyWith(newto: ToStateLoading()));
      to = event.to;
      emit(state.copyWith(newto: ToStateSeted(to: to)));
    });
    on<AgeEventSetFrom>((event, emit) {
      emit(state.copyWith(newfrom: FromStateLoading()));
      from = event.from;
      emit(state.copyWith(newfrom: FromStateSeted(from: from)));
    });
    on<AgeEventCalculate>((event, emit) {
      emit(state.copyWith(newresult: ResultStateLoading()));
      age = calculateage(to, from);
      nextbirthday = calculatenextbirthday(to, from);
      diffrence = dateDifference(fromDate: from, toDate: to);
      summary = DateTime(to.year, to.month, to.day)
          .difference(DateTime(from.year, from.month, from.day));
      emit(
        state.copyWith(
          newresult: ResultStateCompleted(
              age: age,
              nextbirthday: nextbirthday,
              diffrence: diffrence,
              summary: summary),
        ),
      );
    });
  }
  DateDuration dateDifference(
      {required DateTime fromDate, required DateTime toDate}) {
    return AgeCalculator.dateDifference(fromDate: fromDate, toDate: toDate);
  }

  // String calculateminute() {
  //   return (curentdate.difference(birthday).inMinutes).toString();
  // }

  // String calculatehour() {
  //   return (curentdate.difference(birthday).inHours).toString();
  // }

  // String calculateday() {
  //   return (curentdate.difference(birthday).inDays).toString();
  // }

  // String calculateweek() {
  //   return (curentdate.difference(birthday).inDays / 7).floor().toString();
  // }

  // String calculatemonth() {
  //   return ((curentdate.difference(birthday).inDays / 7) / 4.3571)
  //       .floor()
  //       .toString();
  // }

  // String calculateyear() {
  //   return (((curentdate.difference(birthday).inDays / 7) / 4.3571) / 12)
  //       .floor()
  //       .toString();
  // }

  DateDuration calculatenextbirthday(DateTime to, DateTime from) {
    return AgeCalculator.timeToNextBirthday(to, fromDate: from);
  }

  DateDuration calculateage(DateTime to, DateTime from) {
    return AgeCalculator.age(from, today: to);
  }
}
