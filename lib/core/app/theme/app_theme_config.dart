import 'package:flutter/material.dart';

import '../constants/font_size.dart';
import '../constants/styles.dart';

class AppThemeConfig {
  static ColorScheme colorScheme(
          {required Color seedColor, required Brightness brightness}) =>
      ColorScheme.fromSeed(
        seedColor: seedColor,
        // primary: AppColors.kPRIMARY,
        brightness: brightness,
      );
  static TextTheme textTheme({
    required Color primaryText, //For title.
    Color? secondaryText, //For sub-title.
    Color? caption, //For caption.
  }) =>
      TextTheme(
        displayLarge: customTextStyle(
          fontSize: FontSize.kS57,
          color: primaryText,
        ),
        displayMedium: customTextStyle(
          fontSize: FontSize.kS45,
          color: primaryText,
        ),
        displaySmall: customTextStyle(
          fontSize: FontSize.kS36,
          color: primaryText,
        ),
        headlineLarge: customTextStyle(
          fontSize: FontSize.kS32,
          color: primaryText,
        ),
        headlineMedium: customTextStyle(
          fontSize: FontSize.kS28,
          color: primaryText,
        ),
        headlineSmall: customTextStyle(
          fontSize: FontSize.kS24,
          color: primaryText,
        ),
        titleLarge: customTextStyle(
          fontSize: FontSize.kS22,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: customTextStyle(
          fontSize: FontSize.kS18,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: customTextStyle(
          fontSize: FontSize.kS16,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: customTextStyle(
          fontSize: FontSize.kS16,
          color: primaryText,
        ),
        bodyMedium: customTextStyle(
          fontSize: FontSize.kS14,
          color: primaryText,
        ),
        bodySmall: customTextStyle(
          fontSize: FontSize.kS12,
          color: secondaryText ?? primaryText,
        ),
        labelLarge: customTextStyle(
          fontSize: FontSize.kS14,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: customTextStyle(
          fontSize: FontSize.kS12,
          color: caption ?? primaryText,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: customTextStyle(
          fontSize: FontSize.kS11,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
      );
}
