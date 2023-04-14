import 'package:calculator/model/capabilities.dart';

class SpeedApi {
  getdata() {
    List<Capabilities> items = [
      Capabilities('Meters per second', 'm/s', 1),
      Capabilities('Meters per hour', 'm/h', 3600),
      Capabilities('Kilometers per secound', 'km/s', .0001),
      Capabilities('Kilometers per hour', 'km/h', 3.6),
      Capabilities('Inches per second', 'in/s', 39.37007874402),
      Capabilities('Inches per hour', 'in/h', 141732.28346457),
      Capabilities('Feet per secound', 'ft/s', 3.280839895),
      Capabilities('Feet per hour', 'ft/h', 11811.023622047),
      Capabilities('Miles per secound', 'mi/s', 0.0006213712),
      Capabilities('Miles per hour', 'mi/h', 2.2369362921),
      Capabilities('Knots', 'kn', 1.9438444924),
    ];
    return items;
  }
}
