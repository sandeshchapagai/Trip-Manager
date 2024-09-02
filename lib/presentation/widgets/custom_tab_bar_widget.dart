import 'package:flutter/material.dart';

import '../../core/app/constants/colors.dart';
import '../../core/app/constants/dimensions.dart';
import '../../core/app/constants/styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/theme_extensions.dart';
import '../../data/models/app_static/app_static_model.dart';

class CustomTabBarWidget extends StatelessWidget {
  final List<AppStaticModel> tabList;
  final ScrollPhysics? physics;
  final Decoration? customIndicator;
  final Color? indicatorColor, backgroundColor, borderColor;
  final bool hasDefaultIndicator,
      isScrollable,
      hasBackgroundDecoration,
      hasPadding;
  final TabController? controller;
  final TextStyle? labelStyle, unselectedLabelStyle;
  final TabAlignment? tabAlignment;
  final Function(int indext)? onTap;
  final double? height;
  final bool hasHorizontalPadding;

  const CustomTabBarWidget(
      {super.key,
      required this.tabList,
      this.onTap,
      this.physics,
      this.labelStyle,
      this.isScrollable = false,
      this.tabAlignment,
      this.unselectedLabelStyle,
      this.indicatorColor,
      this.backgroundColor,
      this.hasDefaultIndicator = false,
      this.hasBackgroundDecoration = false,
      this.hasPadding = false,
      this.customIndicator,
      this.controller,
      this.height,
      this.hasHorizontalPadding = false,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    var containsIndicator = customIndicator != null || hasDefaultIndicator;
    return Column(
      children: [
        Container(
          height: height ?? (containsIndicator ? 40 : 30),
          decoration: hasBackgroundDecoration
              ? BoxDecoration(
                  border:
                      Border.all(color: borderColor ?? AppColors.kTRANSPARENT),
                  borderRadius: BorderRadius.circular(5),
                  color: backgroundColor,
                )
              : null,
          padding: hasPadding
              ? const EdgeInsets.all(6)
              : hasHorizontalPadding
                  ? const EdgeInsets.symmetric(horizontal: 20)
                  : null,
          child: TabBar(
            physics: physics,
            isScrollable: isScrollable,
            tabAlignment: tabAlignment,
            tabs: tabList.map((e) => Tab(text: e.heading ?? "")).toList(),
            onTap: (int indext) => onTap != null ? onTap!(indext) : null,
            controller: controller,
            indicator: customIndicator ??
                (hasDefaultIndicator
                    ? BoxDecoration(
                        color: indicatorColor ?? context.colors.primary,
                        borderRadius:
                            BorderRadius.circular(Responsive.kAppBorderRadius),
                      )
                    : null),
            indicatorWeight: 1.5,
            labelStyle: hasDefaultIndicator
                ? customTextStyle(color: context.colors.whiteText)
                : labelStyle,
            unselectedLabelStyle: unselectedLabelStyle,
            indicatorPadding: EdgeInsets.symmetric(
                vertical: containsIndicator
                    ? 0
                    : isScrollable
                        ? 0
                        : -4),
          ),
        ),
        kVTabBarViewGap
      ],
    );
  }
}
