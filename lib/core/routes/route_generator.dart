import 'package:flutter/material.dart';
import 'package:trip_manager/core/routes/route_config.dart';
import 'package:trip_manager/presentation/screens/main/main_screen.dart';
import 'package:trip_manager/presentation/screens/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      RouteConfig.initialRoute =>
        MaterialPageRoute(builder: (_) => const SplashScreen()),
      RouteConfig.boardingRoute =>
        MaterialPageRoute(builder: (_) => const MainScreen()),
      _ => null
    };
  }
}
