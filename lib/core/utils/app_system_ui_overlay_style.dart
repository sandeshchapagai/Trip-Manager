import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';

import '../app/constants/colors.dart';

SystemUiOverlayStyle appSystemUiOverlayStyle({required BuildContext context}) =>
    SystemUiOverlayStyle(
        statusBarColor: AppColors.kTRANSPARENT,
        statusBarIconBrightness:
            context.isDarkMode ? Brightness.light : Brightness.dark);
