import 'package:flutter/material.dart';
import 'package:trip_manager/core/routes/route_config.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      RouteConfig.initialRoute =>
        MaterialPageRoute(builder: (_) => Container()),
      _ => null
    };
  }
}
