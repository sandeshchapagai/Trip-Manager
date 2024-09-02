import '../../data/models/country/countries.dart';

class InvalidCharactersException implements Exception {}

class NumberTooLongException implements Exception {}

class NumberTooShortException implements Exception {}

class PhoneNumberValidator {
  String countryISOCode;
  String countryCode;
  String number;

  PhoneNumberValidator({
    required this.countryISOCode,
    required this.countryCode,
    required this.number,
  });

  factory PhoneNumberValidator.fromCompleteNumber(
      {required String completeNumber}) {
    if (completeNumber == "") {
      return PhoneNumberValidator(
          countryISOCode: "", countryCode: "", number: "");
    }

    try {
      Country country = getCountry(completeNumber);
      String number;
      if (completeNumber.startsWith('+')) {
        number = completeNumber
            .substring(1 + country.dialCode.length + country.regionCode.length);
      } else {
        number = completeNumber
            .substring(country.dialCode.length + country.regionCode.length);
      }
      return PhoneNumberValidator(
          countryISOCode: country.code,
          countryCode: country.dialCode + country.regionCode,
          number: number);
    } on InvalidCharactersException {
      rethrow;
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      return PhoneNumberValidator(
          countryISOCode: "", countryCode: "", number: "");
    }
  }

  String get completeNumber {
    return "$countryCode $number";
  }

  bool isValidNumber() {
    Country country = getCountry(completeNumber);
    if (number.length < country.minLength) {
      throw NumberTooShortException();
    }

    if (number.length > country.maxLength) {
      throw NumberTooLongException();
    }
    return true;
  }

  @override
  String toString() =>
      'PhoneNumber(countryISOCode: $countryISOCode, countryCode: $countryCode, number: $number)';

  static Country getCountry(String phoneNumber) {
    if (phoneNumber == "") {
      throw NumberTooShortException();
    }

    final validPhoneNumber = RegExp(r'^[+0-9]*[0-9]*$');

    if (!validPhoneNumber.hasMatch(phoneNumber)) {
      throw InvalidCharactersException();
    }

    if (phoneNumber.startsWith('+')) {
      return countries.firstWhere((country) => phoneNumber
          .substring(1)
          .startsWith(country.dialCode + country.regionCode));
    }
    return countries.firstWhere((country) =>
        phoneNumber.startsWith(country.dialCode + country.regionCode));
  }
}
