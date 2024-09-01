import 'package:flutter/material.dart';

class RouteNavigator {
  static arguments(BuildContext context) =>
      ModalRoute.of(context)?.settings.arguments;

  static back(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }

  static navigate(BuildContext context, dynamic pageRoute,
      {bool fullScreenDialog = false}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => pageRoute),
            fullscreenDialog: fullScreenDialog));
  }

  static navigateNamed(BuildContext context, String routeName,
      {dynamic arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static navigateOffAllNamed(BuildContext context, String routeName,
      {Object? args}) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: args,
    );
  }

  static pushAndRemoveUntil(BuildContext context, dynamic pageRoute,
      {bool fullScreenDialog = false}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: ((context) => pageRoute),
            fullscreenDialog: fullScreenDialog),
        (route) => false);
  }

  static pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => page),
      ),
    );
  }

  static pushReplacementNamed(BuildContext context, String routeName,
      {bool fullScreenDialog = false, Object? args, dynamic arguments}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }
}
