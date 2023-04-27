import 'package:age_calculator/age_calculator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'age_event.dart';
import 'age_state.dart';

class AgeBloc extends Bloc<IAgeEvent, IAgeState> {
  DateTime curentdate = DateTime.now();
  DateTime birthday = DateTime.now();
  DateDuration nextbirthday = DateDuration();
  DateDuration age = DateDuration();
  int nextyear = 0;

  AgeBloc(super.initialState) {
    on<AgeEvent>((event, emit) {
      DateTime curentdate = DateTime.now();
      birthday = event.birthdaydate;
      DateTime.now().year - event.birthdaydate.year;
      emit(AgeState(
        curentdate,
        birthday,
        calculateminute(),
        calculatehour(),
        calculateday(),
        calculateweek(),
        calculatemonth(),
        calculateyear(),
        calculateage(),
        calculatenextbirthday(),
      ));
    });
  }
  String calculateminute() {
    return (curentdate.difference(birthday).inMinutes).toString();
  }

  String calculatehour() {
    return (curentdate.difference(birthday).inHours).toString();
  }

  String calculateday() {
    return (curentdate.difference(birthday).inDays).toString();
  }

  String calculateweek() {
    return (curentdate.difference(birthday).inDays / 7).floor().toString();
  }

  String calculatemonth() {
    return ((curentdate.difference(birthday).inDays / 7) / 4.3571)
        .floor()
        .toString();
  }

  String calculateyear() {
    return (((curentdate.difference(birthday).inDays / 7) / 4.3571) / 12)
        .floor()
        .toString();
  }

  DateDuration calculatenextbirthday() {
    nextbirthday = AgeCalculator.timeToNextBirthday(birthday);
    return nextbirthday;
  }

  DateDuration calculateage() {
    age = AgeCalculator.age(birthday);
    return age;
  }
}
