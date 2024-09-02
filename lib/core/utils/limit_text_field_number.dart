import 'package:flutter/services.dart';

class LimitRange extends TextInputFormatter {
  final double range;
  LimitRange({this.range = 1000});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == "") return newValue;
    if (double.parse(newValue.text.toString()) < (range + 0.01)) {
      return newValue;
    }
    return oldValue;
  }
}
