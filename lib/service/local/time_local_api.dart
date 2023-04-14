import 'package:calculator/model/capabilities.dart';

class TimeApi {
  getdata() {
    List<Capabilities> items = [
      Capabilities('Milliseconds', 'ms', 1000),
      Capabilities('Second', 's', 1),
      Capabilities('Minutes', 'min', 0.0166666667),
      Capabilities('hours', 'h', 0.0002777778),
      Capabilities('Days', 'd', 0.0000115741),
      Capabilities('Weeks', 'wk', 0.0000016534),
    ];
    return items;
  }
}
