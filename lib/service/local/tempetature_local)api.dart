import 'package:calculator/model/capabilities.dart';

class TempetatureApi {
  getdata() {
    List<Capabilities> items = [
      Capabilities('Celsius', '°C', 1),
      Capabilities('Fahrenheit', '°F', 33.8),
      Capabilities('Kelvin', 'K', 274.15),
    ];
    return items;
  }
}
