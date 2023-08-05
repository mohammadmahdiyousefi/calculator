import 'package:calculator/model/gap.dart';

abstract class IGapState {}

class InitGap extends IGapState {
  List<Gap> gaps;
  InitGap(this.gaps);
}

class GapState extends IGapState {
  List<Gap> gaps;
  double max;
  double min;
  GapState(this.gaps, this.max, this.min);
}

class CalclatGapState extends IGapState {
  List<Gap> gaps;
  double max;
  CalclatGapState(this.gaps, this.max);
}
