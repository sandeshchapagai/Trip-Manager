import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trip_manager/core/function/text_capitalization.dart';

import '../app/constants/app_text.dart';

String validationAPIException(http.Response response) {
  String validationException = "";
  var decodedJson = <String, dynamic>{};

  decodedJson = json.decode(response.body);
  if (decodedJson.containsKey(AppText.responseMessage)) {
    validationException = json.decode(response.body)[AppText.responseMessage] ??
        AppText.somethingWentWrong;
  } else {
    var message = decodedJson.entries.isNotEmpty
        ? List<String>.from(
            decodedJson.entries.first.value?.map((x) => x) ?? [])
        : [];
    validationException =
        "${message.isNotEmpty ? message.first : AppText.somethingWentWrong}."
            .toCapitalized();
  }
  return validationException;
}

class ApiException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  ApiException([this.message, this.prefix, this.url]);
}

class ApiNotRespondingException extends ApiException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responded in time', url);
}

class BadRequestException extends ApiException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url);
}

class ConflictException extends ApiException {
  ConflictException([String? message, String? url])
      : super(message, 'Conflict Request', url);
}

class DataNotFoundException extends ApiException {
  DataNotFoundException([String? message, String? url])
      : super(message, 'Data not found', url);
}

class FetchDataException extends ApiException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process', url);
}

class UnAuthorizedException extends ApiException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorized request', url);
}
