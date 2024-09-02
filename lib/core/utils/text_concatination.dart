class TextConcatination {
  static String? concatinateWithComma({required List<dynamic>? text}) =>
      text?.map((e) => e.name).join(", ");

  static String concatinateWithSpace({required List<String> text}) =>
      text.isNotEmpty ? text.join(" ") : "";
}
