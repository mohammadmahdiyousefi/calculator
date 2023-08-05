import 'package:calculator/bloc/gap/gap_event.dart';
import 'package:calculator/bloc/gap/gap_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/gap.dart';

class GapBloc extends Bloc<IGapEvent, IGapState> {
  List<Gap> gaps = [];
  double max = 0;
  double min = 0;
  GapBloc(super.initialState) {
    on<AddGapEvent>((event, emit) {
      gaps.add(event.gap);
      emit(GapState(gaps, 0, 0));
    });
    on<EditGapEvent>((event, emit) {
      if (gaps.contains(event.gap) && event.index == gaps.indexOf(event.gap)) {
        gaps[event.index] = event.newgap;
      }

      emit(GapState(gaps, 0, 0));
    });
    on<DeletGapEvent>((event, emit) {
      gaps.remove(event.gap);
      emit(GapState(gaps, 0, 0));
    });
    on<CalculatGapEvent>((event, emit) {
      emit(GapState(gaps, maxgrade(), mingrade()));
    });
  }
  double maxgrade() {
    return (gaps.fold<double>(
            0,
            (previousValue, element) =>
                previousValue + (element.maxgrade * element.credits))) /
        (gaps.fold<double>(
            0, (previousValue, element) => previousValue + element.credits));
  }

  double mingrade() {
    return (gaps.fold<double>(
            0,
            (previousValue, element) =>
                previousValue + (element.mingrade * element.credits))) /
        (gaps.fold<double>(
            0, (previousValue, element) => previousValue + element.credits));
  }
}
