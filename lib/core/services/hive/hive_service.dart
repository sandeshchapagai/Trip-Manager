import 'package:hive_flutter/hive_flutter.dart';

import '../di_injection/get_di_injection.dart';

class HiveService {
  static init() async {
    await Hive.initFlutter();
    // HiveAdapter.register();
    await hiveStorage.jwtBoxOpened();
    await hiveStorage.currencyBoxOpened();
  }
}
