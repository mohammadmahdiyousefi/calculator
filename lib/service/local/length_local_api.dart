import 'package:calculator/model/capabilities.dart';

class LengthApi {
  getdata() {
    List<Capabilities> items = [
      Capabilities('Milimeters', 'mm', 1000),
      Capabilities('Centimeters', 'cm', 100),
      Capabilities('Meters', 'm', 1),
      Capabilities('Kilometers', 'km', 0.001),
      Capabilities('Inches', 'in', 39.3700787402),
      Capabilities('Feet', 'ft', 3.280839895),
      Capabilities('Yard', 'yd', 1.0936132983),
      Capabilities('Miles', 'mi', 0.0006213712),
      Capabilities('Nautical miles', 'nm', 0.0005399568),
      Capabilities('Mils', 'mil', 39370.078740157),
    ];
    return items;
  }
}
