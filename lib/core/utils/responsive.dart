import 'dart:io';

import 'package:flutter/material.dart';

import '../app/constants/dimensions.dart';

class Responsive extends StatelessWidget {
  static double kPlatformSpecBottomPadding = Platform.isAndroid ? 0 : 20;
  static const textFieldContentPadding =
      EdgeInsets.symmetric(horizontal: 10, vertical: kVTextFieldContentPadding);
  static const double kHCreateButtonMargin = 60;
  static const double kHTabletMainPagePadding = 20;
  static const double kVTextFieldContentPadding = 13;
  static const double kHTabletDialogPadding = 120;
  static const double kHTabletTabBarPadding = 150;
  static const double kHMobileSheetPadding = 20.0;
  static const double kHMobilePhonePadding = 20.0;
  static const double kTabBarBottomPadding = 8;
  static const double kCreateUpdateButtonHeight = 41;
  static const double kSelectUpdateInfoBottomSheetHeight = 180;
  static const double kButtonHeight = 47;
  static const double kAppToolbarHeight = 47;
  static const double kListBottomGap = 10;
  static const double kAppBorderRadius = 5;
  static const double kInputBorderRadius = 7;
  static const double kTableHeadingBorderRadius = 5;
  static const double kAppBorderRadius7 = 7;
  static const double kAppBorderRadius8 = 8;
  static const double kBottomSheetRadius = 7;
  static const double kAppBorderWidth = .6;
  static const double kSheetDividerHeight = 35;
  final Widget? child;
  final BuildContext context;
  final double? mblLeft,
      mblRight,
      mblBottom,
      tabLeft,
      tabRight,
      tabBottom,
      mblTop,
      tabTop;
  final bool hasVerticalPadding, hasHorizontalPadding;
  const Responsive({
    super.key,
    required this.context,
    required this.child,
    this.mblLeft,
    this.mblRight,
    this.mblBottom,
    this.tabLeft,
    this.tabRight,
    this.tabBottom,
    this.hasVerticalPadding = true,
    this.hasHorizontalPadding = true,
    this.mblTop,
    this.tabTop,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: isMobile(ctx: context) ? mblTop ?? 0 : tabTop ?? 0,
          left: hasHorizontalPadding
              ? isMobile(ctx: context)
                  ? mblLeft ?? kHMobilePhonePadding
                  : tabLeft ?? kHTabletMainPagePadding
              : 0,
          right: hasHorizontalPadding
              ? isMobile(ctx: context)
                  ? mblRight ?? kHMobilePhonePadding
                  : tabRight ?? kHTabletMainPagePadding
              : 0,
          bottom: hasVerticalPadding
              ? isMobile(ctx: context)
                  ? mblBottom ?? 13
                  : tabBottom ?? 13
              : 0),
      child: child,
    );
  }

  static bool isMobile({required BuildContext ctx}) => appWidth(ctx) < 600;

  static bool isTablet({required BuildContext ctx}) => appWidth(ctx) >= 600;
}
