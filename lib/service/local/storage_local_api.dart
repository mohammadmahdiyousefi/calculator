import 'package:calculator/model/capabilities.dart';

class StorageApi {
  getdata() {
    List<Capabilities> items = [
      Capabilities('Bits', 'bit', 8796093022208),
      Capabilities('Bytes', 'B', 1099511627776),
      Capabilities('Kilobytes', 'KB', 1073741824),
      Capabilities('Megabyets', 'MB', 1048576),
      Capabilities('Gigabyets', 'GB', 1024),
      Capabilities('Terabytes', 'TB', 1),
    ];
    return items;
  }
}
