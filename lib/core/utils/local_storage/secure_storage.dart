import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../enums/enums.dart';
import '../../services/di_injection/get_di_injection.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();
  static const _tokenKey = "token";
  static const _userid = "userId";
  static const _isLoggedIn = "isLoggedIn";
  static const _themeModes = "themeModes";
  static const _activeRestaurantId = "activeRestaurantId";
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  factory SecureStorage() => _instance;
  SecureStorage._internal();
  Future get getActiveRestaurantId async =>
      await _storage.read(key: _activeRestaurantId);
  Future get getLoggedInStatus async => await _storage.read(key: _isLoggedIn);
  Future get getThemeMode async => await _storage.read(key: _themeModes);
  Future get getToken async => await _storage.read(key: _tokenKey);
  Future get getUserId async => await _storage.read(key: _userid);

  Future<void> deleteActiveRestaurant() async {
    await Future.wait([
      _storage.delete(key: _activeRestaurantId),
      hiveStorage.deleteHiveCredentials()
    ]);
  }

  Future<void> deleteCredentials() async {
    await Future.wait([
      _storage.delete(key: _tokenKey),
      _storage.delete(key: _userid),
      _storage.delete(key: _isLoggedIn),
      _storage.delete(key: _activeRestaurantId),
      hiveStorage.deleteHiveCredentials()
    ]);
  }

  Future<void> saveActiveRestaurantId({required String? id}) async =>
      await _storage.write(key: _activeRestaurantId, value: id);
  Future<void> saveLoginStatus({required LoggedInStatus loginStatus}) async =>
      await _storage.write(key: _isLoggedIn, value: loginStatus.name);
  Future<void> saveThemeMode({required ThemeMode themeMode}) async =>
      await _storage.write(key: _themeModes, value: themeMode.name);
  Future<void> saveToken({required String? token}) async =>
      await _storage.write(key: _tokenKey, value: token);
  Future<void> saveUserId({required String userId}) async =>
      await _storage.write(key: _userid, value: userId);
}
