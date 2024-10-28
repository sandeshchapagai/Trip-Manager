import 'package:flutter/services.dart';
import 'package:trip_manager/core/function/platform_checker.dart';

class HapticFeedbacks {
  static vibrate() =>
      isIOS ? HapticFeedback.lightImpact() : HapticFeedback.vibrate();
}
