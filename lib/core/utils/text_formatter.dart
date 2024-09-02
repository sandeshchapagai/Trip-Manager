import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app/constants/styles.dart';

List<TextSpan> boldPartialContent(String content) {
  List<TextSpan> spans = [];
  RegExp regExp = RegExp(r"\[(.*?)\]");
  int lastMatchEnd = 0;
  for (var match in regExp.allMatches(content)) {
    if (match.start > lastMatchEnd) {
      spans.add(TextSpan(text: content.substring(lastMatchEnd, match.start)));
    }
    spans.add(TextSpan(
      text: match.group(1),
      style: customTextStyle(fontWeight: FontWeight.w600),
    ));
    lastMatchEnd = match.end;
  }
  if (lastMatchEnd < content.length) {
    spans.add(TextSpan(text: content.substring(lastMatchEnd)));
  }
  return spans;
}

class CapitalizeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    List<String> words = newValue.text.split(" ");
    words[0] = words[0][0].toUpperCase() + words[0].substring(1);
    return TextEditingValue(
      text: words.join(" "),
      selection: newValue.selection,
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r'^(?!.*[\+\(\)\-\s]{2})[\d\+\(\)\-\s]+$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty || _regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
