import 'package:flutter/material.dart';

import '../app/theme/custom_theme_colors.dart';

extension ThemeExtensions on BuildContext {
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      Theme.of(this).bottomNavigationBarTheme;
  BottomSheetThemeData get bottomSheetTheme => Theme.of(this).bottomSheetTheme;
  double get bottomViewInsets => MediaQuery.of(this).viewInsets.bottom;
  CustomThemeColors get colors =>
      Theme.of(this).extension<CustomThemeColors>()!;
  DividerThemeData get dividerTheme => Theme.of(this).dividerTheme;
  IconThemeData get iconTheme => Theme.of(this).iconTheme;
  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  TabBarThemeData get tabBarTheme => Theme.of(this).tabBarTheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
