import '../../data/models/app_static/app_static_model.dart';
import '../../data/models/country/countries.dart';
import '../app/constants/app_text.dart';

class Splits {
  static ({String? filteredToken}) bearerToken({required String? fullToken}) =>
      fullToken?.contains(" ") == true
          ? (filteredToken: fullToken?.split(" ")[1])
          : (filteredToken: fullToken);

  static String convertAppStaticListToCommaCharacter(
      {required List<AppStaticModel> list,
      bool isSubheading = true,
      bool isValue = false}) {
    return list
        .map((e) => isValue
            ? e.value
            : isSubheading
                ? e.subHeading
                : e.heading)
        .join(", ");
  }

  static List<String> convertCommaCharacterToList({
    required String? value,
  }) =>
      value?.split(", ").toList() ?? [];

  static String convertListToCommaSeparatedCharacter(List<String> list) {
    return list.join(', ');
  }

  static String name(String name) {
    if (name.isNotEmpty) {
      var fullName = name.split(" ");
      var firstName = fullName.first;
      var lastName = fullName.length < 2 ? "" : fullName.last;

      var result = "$firstName $lastName";
      return lastName.isEmpty
          ? firstName
              .trim()
              .split(RegExp(''))
              .map((s) => s[0])
              .take(2)
              .join()
              .toUpperCase()
          : result
              .trim()
              .split(RegExp(' +'))
              .map((s) => s[0])
              .take(2)
              .join()
              .toUpperCase();
    }
    return "...";
  }

  static ({String dialCode, String filteredPhoneNumber, String countryCode})
      phoneNumber({required String phoneNumber}) {
    try {
      var containsDialCode = phoneNumber.contains(" ");
      var dialCode = containsDialCode
          ? phoneNumber.split(" ")[0].contains("+")
              ? phoneNumber.split(" ")[0].replaceFirst("+", "")
              : phoneNumber.split(" ")[0]
          : phoneNumber.contains("+")
              ? phoneNumber //Act as dialcode
              : AppText.appDescription;
      var countryCode =
          countries.firstWhere((e) => e.dialCode == dialCode).code;
      var phone = containsDialCode ? phoneNumber.split(" ")[1] : phoneNumber;

      return (
        dialCode: dialCode,
        filteredPhoneNumber: phone,
        countryCode: countryCode
      );
    } catch (e) {
      return (
        dialCode: AppText.appDescription,
        filteredPhoneNumber: "",
        countryCode: AppText.appDescription
      );
    }
  }

  static String replaceUnderscore({
    required String value,
  }) =>
      value.replaceFirst("_", " ");
}
