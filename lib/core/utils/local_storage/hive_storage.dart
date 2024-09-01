import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/authentication/jwt/jwt_hive_payload_model.dart';

class HiveStorage {
  static final HiveStorage _instance = HiveStorage._internal();
  static const _jwtPayload = "jwtPayload";
  static const _currency = "currency";
  factory HiveStorage() => _instance;
  HiveStorage._internal();

  String get getCurrency => currencyBox().get(_currency);
  JwtHivePayloadModel? get getJwtPayload => jwtBox().get(_jwtPayload);

  Box currencyBox() => Hive.box(_currency);

  Future<Box> currencyBoxOpened() async => await Hive.openBox(_currency);

  Future deleteHiveCredentials() async {
    await Future.wait([
      jwtBox().delete(_jwtPayload),
      currencyBox().delete(_currency),
    ]);
  }

  Box<JwtHivePayloadModel> jwtBox() =>
      Hive.box<JwtHivePayloadModel>(_jwtPayload);

  Future<Box> jwtBoxOpened() async =>
      await Hive.openBox<JwtHivePayloadModel>(_jwtPayload);

  saveJwtPayload({required JwtHivePayloadModel value}) =>
      jwtBox().put(_jwtPayload, value);
}
