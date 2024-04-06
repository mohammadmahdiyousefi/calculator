abstract class IBmiEvent {}

class BMICalculateEvent extends IBmiEvent {
  final double height;
  final double weight;
  final int age;
  BMICalculateEvent(this.age, this.height, this.weight);
}
