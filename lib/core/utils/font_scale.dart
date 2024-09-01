import 'package:flutter/material.dart';

class FontScale {
  static MediaQueryData scaleSize({required BuildContext context}) {
    //Function to adjust application font-size with respect to font-size of PHONE
    final mediaQuery = MediaQuery.of(context);
    final scale =
        mediaQuery.textScaler.clamp(minScaleFactor: 0.8, maxScaleFactor: 1.2);
    return mediaQuery.copyWith(textScaler: scale);
  }
}
