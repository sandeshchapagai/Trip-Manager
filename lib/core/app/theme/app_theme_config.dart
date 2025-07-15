import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import '../constants/colors.dart';
import '../constants/font_size.dart';
import '../constants/styles.dart';
import 'custom_theme_colors.dart';

class AppThemeConfig {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      shadowColor: AppColors.kTRANSPARENT,
      backgroundColor: AppColors.kPRIMARY,
      foregroundColor: AppColors.kWHITE,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
  static final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.kPRIMARY.withOpacity(
                0.1); // The splash color when the button is pressed.
          }
          return null; // Use the component's default.
        },
      ),
      elevation: WidgetStateProperty.all(2),
      backgroundColor: WidgetStateProperty.all(AppColors.kTRANSPARENT),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.kPRIMARY.withOpacity(0.1);
          }
          return null;
        },
      ),
      elevation: WidgetStateProperty.all(2),
      backgroundColor: WidgetStateProperty.all(AppColors.kTRANSPARENT),
      side: WidgetStateProperty.all(
        const BorderSide(
          color: AppColors.kPRIMARY,
          width: .5,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
  static final checkBoxTheme = CheckboxThemeData(
    checkColor: WidgetStateProperty.all(AppColors.kWHITE),
  );

  static const bottomSheetThemeData = BottomSheetThemeData(
    modalBarrierColor: AppColors.kBARRIER3,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
  );

  static const progressIndicatorTheme =
      ProgressIndicatorThemeData(color: AppColors.kPRIMARY);

  static AppBarTheme appBarTheme(
          {required Color textColor, required Color backgroundColor}) =>
      AppBarTheme(
        titleTextStyle: customTextStyle(
            fontSize: FontSize.kS18,
            fontWeight: FontWeight.w500,
            color: textColor),
        backgroundColor: backgroundColor,
      );

  static ColorScheme colorScheme(
          {required Color seedColor, required Brightness brightness}) =>
      ColorScheme.fromSeed(
        seedColor: seedColor,
        primary: AppColors.kPRIMARY,
        brightness: brightness,
      );

  static DialogTheme dialogTheme({Color? color}) => DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Responsive.kAppBorderRadius7),
      ),
      surfaceTintColor: color);

  static DividerThemeData dividerTheme({required Color color}) =>
      DividerThemeData(color: color, thickness: .6);

  static ExpansionTileThemeData expansionTileThemeData(
          {required Color dividerColor}) =>
      ExpansionTileThemeData(
        childrenPadding: const EdgeInsets.fromLTRB(15, 0, 10, 15),
        tilePadding: const EdgeInsets.only(left: 15, right: 10),
        collapsedShape: RoundedRectangleBorder(
            side: BorderSide(color: dividerColor),
            borderRadius: BorderRadius.circular(5)),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: dividerColor),
            borderRadius: BorderRadius.circular(5)),
      );

  static IconThemeData iconTheme({required Color color}) =>
      IconThemeData(color: color);

  static InputDecorationTheme inputDecorationTheme({
    required Color label,
    required Color hint,
    Color? darkThemeBorder,
    Color? darkTheme,
    Color? darkErrorTheme,
  }) =>
      InputDecorationTheme(
        prefixStyle: TextStyle(color: darkTheme ?? AppColors.kBLACK),
        errorMaxLines: 2,
        errorStyle:
            customTextStyle(fontSize: FontSize.kS12, color: darkErrorTheme),
        labelStyle: customTextStyle(fontSize: FontSize.kS13, color: label),
        hintStyle: customTextStyle(
          fontSize: FontSize.kS13,
          color: hint,
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: darkThemeBorder ?? AppColors.kGREYSHADE400,
          ),
          borderRadius: BorderRadius.circular(Responsive.kInputBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: .5,
            color: darkThemeBorder ?? AppColors.kGREYSHADE300,
          ),
          borderRadius: BorderRadius.circular(Responsive.kInputBorderRadius),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              width: .5,
              color: darkThemeBorder ?? AppColors.kGREYSHADE300,
            ),
            borderRadius: BorderRadius.circular(Responsive.kInputBorderRadius)),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: .5,
            color: AppColors.kERROR,
          ),
          borderRadius: BorderRadius.circular(Responsive.kInputBorderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: .5,
            color: darkThemeBorder ?? AppColors.kGREYSHADE300,
          ),
          borderRadius: BorderRadius.circular(Responsive.kInputBorderRadius),
        ),
      );

  static PageTransitionsTheme pageTransitionsTheme() =>
      const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  static tabBarTheme() => TabBarThemeData(
        dividerColor: AppColors.kTRANSPARENT,
        indicatorColor: AppColors.kPRIMARY,
        indicatorSize: TabBarIndicatorSize.tab,
        overlayColor: WidgetStateProperty.all(AppColors.kTRANSPARENT),
        labelStyle: customTextStyle(
            color: AppColors.kPRIMARY,
            fontSize: FontSize.kS15,
            fontWeight: FontWeight.w500),
        unselectedLabelStyle: customTextStyle(
            fontSize: FontSize.kS15, fontWeight: FontWeight.w500),
      );

  static TextTheme textTheme({
    required Color primaryText, //For title.
    Color? secondaryText, //For sub-title.
    Color? caption, //For caption.
  }) =>
      TextTheme(
        displayLarge: customTextStyle(
          fontSize: FontSize.kS57,
          color: primaryText,
        ),
        displayMedium: customTextStyle(
          fontSize: FontSize.kS45,
          color: primaryText,
        ),
        displaySmall: customTextStyle(
          fontSize: FontSize.kS36,
          color: primaryText,
        ),
        headlineLarge: customTextStyle(
          fontSize: FontSize.kS32,
          color: primaryText,
        ),
        headlineMedium: customTextStyle(
          fontSize: FontSize.kS28,
          color: primaryText,
        ),
        headlineSmall: customTextStyle(
          fontSize: FontSize.kS24,
          color: primaryText,
        ),
        titleLarge: customTextStyle(
          fontSize: FontSize.kS22,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: customTextStyle(
          fontSize: FontSize.kS18,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: customTextStyle(
          fontSize: FontSize.kS16,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: customTextStyle(
          fontSize: FontSize.kS16,
          color: primaryText,
        ),
        bodyMedium: customTextStyle(
          fontSize: FontSize.kS14,
          color: primaryText,
        ),
        bodySmall: customTextStyle(
          fontSize: FontSize.kS12,
          color: secondaryText ?? primaryText,
        ),
        labelLarge: customTextStyle(
          fontSize: FontSize.kS14,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: customTextStyle(
          fontSize: FontSize.kS12,
          color: caption ?? primaryText,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: customTextStyle(
          fontSize: FontSize.kS11,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
      );

  static List<ThemeExtension<CustomThemeColors>> themeExtension({
    Color? whiteTheme,
    Color? darkTheme,
    Color? darkBackgroundTheme,
    Color? darkInputFilled,
    Color? quaternaryDarkBackground,
    Color? darkModeSecondaryText,
    Color? darkModeThemeCaption,
  }) =>
      [
        CustomThemeColors(
          primary: AppColors.kPRIMARY,
          primaryLight: AppColors.kPRIMARYLIGHT,
          primarySecondaryLight: AppColors.kPRIMARYSECONDARYLIGHT,
          whiteIcon: AppColors.kWHITE,
          secondaryText: darkModeSecondaryText ?? AppColors.kSECONDARYTEXT,
          themeCaption: darkModeThemeCaption ?? AppColors.kCAPTION,
          tertiaryText: whiteTheme ?? AppColors.kTERTIARYTEXT,
          white: darkTheme ?? AppColors.kWHITE,
          whiteText: AppColors.kWHITE,
          caption: AppColors.kCAPTION,
          secondary: darkTheme ?? AppColors.kSECONDARY,
          primaryBackground:
              darkBackgroundTheme ?? AppColors.kPRIMARYBACKGROUND,
          secondaryBackground:
              darkBackgroundTheme ?? AppColors.kSECONDARYBACKGROUND,
          tertiaryBackground:
              darkBackgroundTheme ?? AppColors.kTERTIARYBACKGROUND,
          placeholder: AppColors.kPLACEHOLDER,
          green: AppColors.kGREEN,
          darkGreen: AppColors.kDARKGREEN,
          lightGreen: AppColors.kGREENLIGHT,
          grayShade300: whiteTheme ?? AppColors.kGREYSHADE300,
          theme: darkTheme ?? AppColors.kWHITE,
          purple: AppColors.kPURPLE,
          lightPurple: AppColors.kPURPLELIGHT,
          error: AppColors.kERROR,
          red: AppColors.kRED,
          lightRed: AppColors.kLIGHTRED,
          darkRed: AppColors.kDARKRED,
          brown: AppColors.kBROWN,
          blue: AppColors.kBLUE,
          boxShadow: AppColors.kBOXSHADOW,
          blueVariant: AppColors.kBLUEVARIANT,
          blueVariantLight: AppColors.kBLUEVARIANTLIGHT,
          yellow: AppColors.kYELLOW,
          lightYellow: AppColors.kYELLOWLIGHT,
          inputFilled: darkInputFilled ?? AppColors.kINPUTFILLED,
          secondaryWhite: darkBackgroundTheme ?? AppColors.kWHITE,
          lightBlue: AppColors.kBLUELIGHT,
          darkBlue: AppColors.kDARKBLUE,
          black: AppColors.kBLACK,
          primaryDarkBlue: AppColors.kPRIMARYDARKBLUE,
          primaryLightBlue: AppColors.kPRIMARYBLUELIGHT,
          primaryLightGreen: AppColors.kPRIMARYGREENLIGHT,
          primaryDarkGreen: AppColors.kPRIMARYDARKGREEN,
          carbonGrey: AppColors.kCARBONGREY,
          orangyRed: AppColors.kORANGYRED,
          quaternaryBackground:
              quaternaryDarkBackground ?? AppColors.kQUATERNARYLIGHTBACKGROUND,
        ),
      ];
}
