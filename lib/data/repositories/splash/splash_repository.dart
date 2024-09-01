import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/app/constants/app_text.dart';
import '../../../core/routes/route_config.dart';
import '../../../core/routes/route_navigator.dart';
import '../../../core/services/di_injection/get_di_injection.dart';
import '../../../core/utils/local_storage/app_shared_preferences.dart';

class SplashRepository {
  final bool isAppNewlyLaunched = AppSharedPreferences.isAppNewlyLaunched;

  initSplashScreen({required BuildContext context}) {
    if (isAppNewlyLaunched) {
      secureStorage.deleteCredentials();
    }

    Timer(const Duration(seconds: 2), () async {
      return switch (await secureStorage.getLoggedInStatus) {
        AppText.loggedIn => RouteNavigator.navigateOffAllNamed(
            context.mounted ? context : context, RouteConfig.mainRoute),
        _ => RouteNavigator.navigateOffAllNamed(
            context.mounted ? context : context, RouteConfig.boardingRoute)
      };
    });
  }
}
