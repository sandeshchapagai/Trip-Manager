import 'package:flutter/material.dart';

import 'app_theme_config.dart';

class AppThemes {
  static final lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: AppThemeConfig.colorScheme(
        seedColor: Colors.white,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppThemeConfig.textTheme(primaryText: Colors.white));
  static final darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: AppThemeConfig.colorScheme(
        seedColor: Colors.black,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Colors.black,
      textTheme: AppThemeConfig.textTheme(primaryText: Colors.white));
}
