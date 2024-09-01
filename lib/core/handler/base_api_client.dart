import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../app/constants/app_text.dart';
import '../config/api_config.dart';
import '../error/api_exceptions.dart';
import '../function/sensitive_server_credentails.dart';
import '../services/di_injection/get_di_injection.dart';

class BaseApiClient {
  static const int timeOutDuration = 20;
  static final Map<String, String> _headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json'
  };
  var client = http.Client();

  static Future<dynamic> delete(
      {required String baseUrl,
      required String api,
      bool? hasHeaderToken = true,
      dynamic payloadObj}) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj ?? {});
    try {
      var response = await http
          .delete(uri,
              body: payload,
              headers: await syncHeaders(hasHeaderToken: hasHeaderToken))
          .timeout(const Duration(seconds: timeOutDuration));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(AppText.noInternetConnection, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          AppText.somethingWentWrong, uri.toString());
    }
  }

  static Future<dynamic> fetch({
    required String baseUrl,
    required String api,
    Map<String, String>? optionalHeaders,
  }) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http
          .get(uri,
              headers: await syncHeaders(
                  hasHeaderToken: true, optionalHeaders: optionalHeaders))
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(AppText.noInternetConnection, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          AppText.somethingWentWrong, uri.toString());
    }
  }

  static Future<Map<String, String>> normalHeader(bool? hasHeaderToken) async {
    var defaultHeader = <String, String>{};
    if (hasHeaderToken == true) {
      return defaultHeader
        ..addAll(_headers)
        ..addAll({
          HttpHeaders.authorizationHeader:
              '${ApiConfig.bearer} ${await secureStorage.getToken}'
        });
    }
    return defaultHeader..addAll(_headers);
  }

  static Future<Map<String, String>> optionalHeader(
      bool? hasHeaderToken, Map<String, String> optionalHeader) async {
    var defaultHeader = <String, String>{};
    if (hasHeaderToken == true) {
      return defaultHeader
        ..addAll(_headers)
        ..addAll(optionalHeader)
        ..addAll({
          HttpHeaders.authorizationHeader:
              '${ApiConfig.bearer} ${await secureStorage.getToken}'
        });
    }
    return defaultHeader
      ..addAll(_headers)
      ..addAll(optionalHeader);
  }

  static Future<dynamic> patch(
      {required String baseUrl,
      required String api,
      required Map payloadObj,
      bool hasHeaderToken = true,
      String? customToken}) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http
          .patch(uri,
              body: payload,
              headers: await syncHeaders(hasHeaderToken: hasHeaderToken))
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(AppText.noInternetConnection, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          AppText.somethingWentWrong, uri.toString());
    }
  }

  static Future<dynamic> post(
      {required String baseUrl,
      required String api,
      required dynamic payloadObj,
      bool hasHeaderToken = true,
      Map<String, String>? optionalHeader}) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http
          .post(uri,
              body: payload,
              headers: await syncHeaders(
                  hasHeaderToken: hasHeaderToken,
                  optionalHeaders: optionalHeader))
          .timeout(const Duration(seconds: timeOutDuration));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(AppText.noInternetConnection, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          AppText.somethingWentWrong, uri.toString());
    }
  }

  static Future<dynamic> postWithFile(
      {required String baseUrl,
      required String api,
      Map<String, String>? payloadObj,
      Iterable<MapEntry<String, String>>? entries,
      bool hasEntries = false,
      XFile? primaryFile,
      XFile? secondaryFile,
      XFile? tertiaryFile,
      List<XFile> files = const [],
      String method = ApiConfig.post,
      bool isForImage = true,
      bool isPrimaryFileRemoved = false,
      String? primaryFileKey,
      String? multipleFileKey,
      String? secondaryFileKey,
      String? tertiaryFileKey,
      bool? hasHeaderToken = true,
      Map<String, String>? optionalHeaders}) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var contentType = MediaType(
        isForImage ? 'image' : "application",
        isForImage ? 'jpg' : "pdf",
      );

      var request = http.MultipartRequest(method, uri);
      request.headers.addAll(await syncHeaders(
          hasHeaderToken: hasHeaderToken, optionalHeaders: optionalHeaders));

      if (primaryFile != null) {
        if (isPrimaryFileRemoved) {
          request.fields[primaryFileKey ?? ApiConfig.imageKeyUrl] = "null";
        } else {
          request.files.add(
            await http.MultipartFile.fromPath(
              "$primaryFileKey",
              primaryFile.path,
              contentType: contentType,
            ),
          );
        }
      }

      if (secondaryFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            "$secondaryFileKey",
            secondaryFile.path,
            contentType: contentType,
          ),
        );
      }
      if (tertiaryFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            "$tertiaryFileKey",
            tertiaryFile.path,
            contentType: contentType,
          ),
        );
      }

      if (files.isNotEmpty == true) {
        for (int i = 0; i < int.parse("${files.length}"); i++) {
          File tempFile = File(files[i].path);

          request.files.add(
            await http.MultipartFile.fromPath(
              "$multipleFileKey",
              tempFile.path,
              contentType: contentType,
            ),
          );
        }
      }

      hasEntries
          ? request.fields.addEntries(entries ?? [])
          : request.fields.addAll(payloadObj ?? {});
      var data = await request.send();
      var response = await http.Response.fromStream(data);

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          AppText.somethingWentWrong, uri.toString());
    }
  }

  static Future<dynamic> put({
    required String baseUrl,
    required String api,
    required dynamic payloadObj,
    bool hasHeaderToken = true,
  }) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http
          .put(uri,
              body: payload,
              headers: await syncHeaders(hasHeaderToken: hasHeaderToken))
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(AppText.noInternetConnection, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          AppText.somethingWentWrong, uri.toString());
    }
  }

  static Future<Map<String, String>> syncHeaders(
      {bool? hasHeaderToken, Map<String, String>? optionalHeaders}) async {
    if (optionalHeaders != null) {
      return await optionalHeader(hasHeaderToken, optionalHeaders);
    }
    return await normalHeader(hasHeaderToken);
  }

  static dynamic _processResponse(http.Response response) async {
    await SensitiveServerCredentials.update(response: response);

    return switch (response.statusCode) {
      200 => utf8.decode(response.bodyBytes),
      201 => utf8.decode(response.bodyBytes),
      400 => throw BadRequestException(
          validationAPIException(response), "${response.request?.url}"),
      401 => throw UnAuthorizedException(
          validationAPIException(response), "${response.request?.url}"),
      403 => throw UnAuthorizedException(
          validationAPIException(response), "${response.request?.url}"),
      404 => throw DataNotFoundException(
          validationAPIException(response), "${response.request?.url}"),
      406 => throw BadRequestException(
          validationAPIException(response), "${response.request?.url}"),
      422 => throw ApiNotRespondingException(
          validationAPIException(response), "${response.request?.url}"),
      409 => throw ConflictException(
          validationAPIException(response), "${response.request?.url}"),
      _ => throw FetchDataException(
          validationAPIException(response), "${response.request?.url}"),
    };
  }
}
