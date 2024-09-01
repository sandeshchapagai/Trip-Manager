import 'package:flutter/material.dart';

class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  final Color? primary;

  const CustomThemeColors({required this.primary});

  @override
  CustomThemeColors copyWith({
    Color? primary,
  }) {
    return CustomThemeColors(primary: primary ?? this.primary);
  }

  @override
  CustomThemeColors lerp(ThemeExtension<CustomThemeColors>? other, double t) {
    if (other == null || other is! CustomThemeColors) {
      return this;
    }
    return CustomThemeColors(primary: Color.lerp(primary, other.primary, t));
  }
}
