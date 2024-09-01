import '../../data/models/app_static/app_static_model.dart';

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

  static String replaceUnderscore({
    required String value,
  }) =>
      value.replaceFirst("_", " ");
}
