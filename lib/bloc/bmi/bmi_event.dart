abstract class IBmiEvent {}

class HeightEvent extends IBmiEvent {
  String height;

  HeightEvent(this.height);
}

class WeightEvent extends IBmiEvent {
  String weight;
  WeightEvent(this.weight);
}
