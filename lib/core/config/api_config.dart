import 'flavor_config.dart';

class ApiConfig {
  static final serverUrl = FlavorConfig.shared.baseUrl;
  static final baseUrl = serverUrl;
  static const httpUrl = "https://";
  static const generalUrl = "/general";
  static const trueUrl = "true";
  static const falseUrl = "false";

  //Authorization
  static const bearer = "Bearer";

  //Socket
  static const socketTransport = ['websocket'];

  //Assets Url
  static const assetsUrl = "/assets";
  static const assetsForQueryUrl = "?assetFor=";

  //Http Method
  static const post = "POST";
  static const put = "PUT";
  static const patch = "PATCH";

  //Update
  static const updateUrl = "/update";

  //Validate
  static const validateUrl = "/validate";

  //Images
  static const imageKeyUrl = "image";
  static const photosKeyUrl = "photos";
  static const logoKeyUrl = "logo";
}
