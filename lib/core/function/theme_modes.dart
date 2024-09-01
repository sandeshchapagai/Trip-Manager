import 'package:flutter/material.dart';

import '../app/constants/app_text.dart';
import '../services/di_injection/get_di_injection.dart';

class ThemeModes {
  static Future<ThemeMode> getThemeMode() async {
    final theme = await secureStorage.getThemeMode;

    return switch (theme) {
      AppText.systemTheme => ThemeMode.system,
      AppText.darkTheme => ThemeMode.dark,
      _ => ThemeMode.light,
    };
  }
}
