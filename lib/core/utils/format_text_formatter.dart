import 'package:flutter/services.dart';

class FormatTextFormatter extends TextInputFormatter {
  final String format;
  final String seperator;

  FormatTextFormatter({required this.format, required this.seperator});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > format.length) return oldValue;
        if (newValue.text.length < format.length &&
            format[newValue.text.length - 1] == seperator) {
          return TextEditingValue(
              text:
                  "${oldValue.text}$seperator${newValue.text.substring(newValue.text.length - 1)}",
              selection:
                  TextSelection.collapsed(offset: newValue.selection.end + 1));
        }
      }
    }
    return newValue;
  }
}
