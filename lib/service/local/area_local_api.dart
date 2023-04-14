import '../../model/capabilities.dart';

// 1m = 0.01a
// 1m = 0.0001ha
class AreaApi {
  getdata() {
    List<Capabilities> items = [
      Capabilities('Acres', 'ac', 0.00024710538146717),
      Capabilities('Ares', 'a', 0.01),
      Capabilities('Hectares', 'ha', 0.0001),
      Capabilities('Square centimeters', 'cm²', 10000),
      Capabilities('Square feet', 'ft²', 10.76391041671),
      Capabilities('Square inches', 'in²', 1550.0031000062),
      Capabilities('Square meters', 'm²', 1),
    ];
    return items;
  }
}
