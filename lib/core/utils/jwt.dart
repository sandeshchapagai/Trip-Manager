import 'dart:convert';

import '../../data/models/authentication/jwt/jwt_hive_payload_model.dart';
import '../function/splits.dart';
import '../services/di_injection/get_di_injection.dart';

class Jwt {
  static getTokenPayload({required String? rawJwt}) async {
    if (rawJwt != null) {
      String normalizedSource = base64Url.normalize(rawJwt.split(".")[1]);
      var payload = utf8.decode(base64Url.decode(normalizedSource));
      var decodedPayload = jwtHivePayloadModelFromJson(payload);
      hiveStorage.saveJwtPayload(value: decodedPayload);
    }
  }

  static setHeaderToken({required String? rawJwt}) async {
    if (rawJwt != null) {
      await secureStorage.saveToken(
          token: Splits.bearerToken(fullToken: rawJwt).filteredToken);
    }
  }
}
