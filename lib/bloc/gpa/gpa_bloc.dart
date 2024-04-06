import 'package:calculator/bloc/gpa/gpa_event.dart';
import 'package:calculator/bloc/gpa/gpa_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/gpa_class.dart';

class GpaBloc extends Bloc<GpaEvent, GpaState> {
  List<GPA> gpas = [];
  double grade = 0;
  int unittotal = 0;
  GpaBloc(super.initialState) {
    on<AddGpaEvent>((event, emit) {
      gpas.add(event.gpa);
      grade = gradecalculate();
      unittotal = unitatotal();
      emit(GpaStateComplet(gpas, grade, unittotal));
    });
    on<EditGpaEvent>((event, emit) {
      if (gpas.contains(event.gpa) && event.index == gpas.indexOf(event.gpa)) {
        gpas[event.index] = event.newgap;
      }
      grade = gradecalculate();
      unittotal = unitatotal();
      emit(GpaStateComplet(gpas, grade, unittotal));
    });
    on<DeletGpaEvent>((event, emit) {
      gpas.remove(event.gpa);
      grade = gradecalculate();
      unittotal = unitatotal();
      emit(GpaStateComplet(gpas, grade, unittotal));
    });
  }
  double gradecalculate() {
    return (gpas.fold<double>(
            0,
            (previousValue, element) =>
                previousValue + (element.grade * element.credits))) /
        (gpas.fold<double>(
            0, (previousValue, element) => previousValue + element.credits));
  }

  int unitatotal() {
    return (gpas.fold<double>(
            0, (previousValue, element) => previousValue + element.credits))
        .toInt();
  }
}
