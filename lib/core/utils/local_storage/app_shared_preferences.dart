import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  //This Approach has been used though using flutter_secure_storage because
  //to handle issue where local/cache data  associated with flutter_secure_storage
  //can't be wipe out in iOS devices.
  static SharedPreferences? _sharedPreference;
  static const _appNewlyLaunch = "app_newly_launch";
  static bool get isAppNewlyLaunched =>
      _sharedPreference?.getBool(_appNewlyLaunch) ?? true;

  static Future setAppNewlyLaunchStatus({required bool isNewLaunch}) async =>
      _sharedPreference?.setBool(_appNewlyLaunch, isNewLaunch);

  static Future sharedPrefInit() async =>
      _sharedPreference = await SharedPreferences.getInstance();
}
