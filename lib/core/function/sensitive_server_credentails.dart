import 'package:http/http.dart' as http;

class SensitiveServerCredentials {
  static update({required http.Response response}) async {
    // var header = ResponseHeaderModel.fromJson(response.headers);
    // await Jwt.setHeaderToken(rawJwt: header.restroxtoken);
    // await Jwt.getTokenPayload(
    //     rawJwt: header.restroxtoken ?? await secureStorage.getToken);
  }
}
