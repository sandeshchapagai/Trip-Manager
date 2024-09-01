import 'package:flutter/material.dart';

class AppStates {
  /// Use 'globalKey' context only if it's unable to render the parent context.
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  static const createKeyboardDismissBehavior =
      ScrollViewKeyboardDismissBehavior.manual;
}
