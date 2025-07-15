import 'package:flutter/material.dart';

import '../constants/app_text.dart';
import '../constants/colors.dart';
import 'app_theme_config.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    fontFamily: AppText.fontFamily,
    useMaterial3: true,
    colorScheme: AppThemeConfig.colorScheme(
      seedColor: AppColors.kWHITE,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.kWHITE,
    primaryColor: AppColors.kPRIMARY,
    splashColor: AppColors.kTRANSPARENT,
    highlightColor: AppColors.kTRANSPARENT,
    // dividerTheme: AppThemeConfig.dividerTheme(color: AppColors.kSTROKE),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.kWHITE,
      selectedItemColor: AppColors.kPRIMARY,
      // unselectedItemColor: AppColors.kICON,
    ),
    appBarTheme: AppThemeConfig.appBarTheme(
        textColor: AppColors.kPRIMARYTEXT, backgroundColor: AppColors.kWHITE),
    textTheme: AppThemeConfig.textTheme(
        primaryText: AppColors.kPRIMARYTEXT,
        secondaryText: AppColors.kSECONDARYTEXT,
        caption: AppColors.kCAPTION),
    elevatedButtonTheme: AppThemeConfig.elevatedButtonTheme,
    outlinedButtonTheme: AppThemeConfig.outlinedButtonTheme,
    textButtonTheme: AppThemeConfig.textButtonTheme,
    inputDecorationTheme: AppThemeConfig.inputDecorationTheme(
      label: AppColors.kPRIMARYTEXT,
      hint: AppColors.kHINT,
    ),
    extensions: AppThemeConfig.themeExtension(),
    progressIndicatorTheme: AppThemeConfig.progressIndicatorTheme,
    bottomSheetTheme: AppThemeConfig.bottomSheetThemeData,
    iconTheme: AppThemeConfig.iconTheme(color: AppColors.kICON),
    checkboxTheme: AppThemeConfig.checkBoxTheme,
    dialogBackgroundColor: AppColors.kWHITE,
    tabBarTheme: AppThemeConfig.tabBarTheme(),
    pageTransitionsTheme: AppThemeConfig.pageTransitionsTheme(),
    expansionTileTheme:
        AppThemeConfig.expansionTileThemeData(dividerColor: AppColors.kSTROKE),
  );

  static final darkTheme = ThemeData(
    fontFamily: AppText.fontFamily,
    useMaterial3: true,
    colorScheme: AppThemeConfig.colorScheme(
      seedColor: AppColors.kBACKGROUNDDARKTHEME,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.kDARKTHEME,
    primaryColor: AppColors.kPRIMARY,
    splashColor: AppColors.kTRANSPARENT,
    highlightColor: AppColors.kTRANSPARENT,
    dividerTheme:
        AppThemeConfig.dividerTheme(color: AppColors.kDARKTHEMESTROKE),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.kDARKTHEME,
      selectedItemColor: AppColors.kPRIMARY,
      unselectedItemColor: AppColors.kLIGHTTHEME,
    ),
    appBarTheme: AppThemeConfig.appBarTheme(
        textColor: AppColors.kLIGHTTHEME,
        backgroundColor: AppColors.kDARKTHEME),
    textTheme: AppThemeConfig.textTheme(primaryText: AppColors.kLIGHTTHEME),
    elevatedButtonTheme: AppThemeConfig.elevatedButtonTheme,
    outlinedButtonTheme: AppThemeConfig.outlinedButtonTheme,
    textButtonTheme: AppThemeConfig.textButtonTheme,
    inputDecorationTheme: AppThemeConfig.inputDecorationTheme(
        label: AppColors.kLIGHTTHEME,
        hint: AppColors.kLIGHTTHEME,
        darkThemeBorder: AppColors.kDARKTHEMESTROKE,
        darkTheme: AppColors.kLIGHTTHEME,
        darkErrorTheme: AppColors.kERROR),
    extensions: AppThemeConfig.themeExtension(
        whiteTheme: AppColors.kLIGHTTHEME,
        darkTheme: AppColors.kDARKTHEME,
        darkBackgroundTheme: AppColors.kBACKGROUNDDARKTHEME,
        darkInputFilled: AppColors.kDARKTHEMESTROKE,
        quaternaryDarkBackground: AppColors.kQUATERNARYDARKBACKGROUND,
        darkModeSecondaryText: AppColors.kLIGHTTHEME,
        darkModeThemeCaption: AppColors.kLIGHTTHEME),
    progressIndicatorTheme: AppThemeConfig.progressIndicatorTheme,
    bottomSheetTheme: AppThemeConfig.bottomSheetThemeData,
    iconTheme: AppThemeConfig.iconTheme(color: AppColors.kLIGHTTHEME),
    checkboxTheme: AppThemeConfig.checkBoxTheme,
    tabBarTheme: AppThemeConfig.tabBarTheme(),
    pageTransitionsTheme: AppThemeConfig.pageTransitionsTheme(),
    expansionTileTheme: AppThemeConfig.expansionTileThemeData(
        dividerColor: AppColors.kDARKTHEMESTROKE),
  );
}
