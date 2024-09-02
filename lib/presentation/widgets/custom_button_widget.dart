import 'package:flutter/material.dart';

import '../../core/app/constants/colors.dart';
import '../../core/app/constants/dimensions.dart';
import '../../core/app/constants/styles.dart';
import '../../core/enums/enums.dart';
import '../../core/utils/keyboard_action.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/theme_extensions.dart';
import 'custom_svg_widget.dart';

class CIconButton implements CustomButton {
  Widget customIconWidget(
      {Widget? customIconWidget,
      bool isSvg = true,
      String? icon,
      double? iconHeight,
      double? iconWidth,
      Color? iconColor,
      IconData? iconData,
      bool isColorFiltered = true,
      required BuildContext context,
      double? iconSize}) {
    return customIconWidget ??
        (isSvg
            ? CustomSvgWidget(
                icon: icon ?? "",
                height: iconHeight,
                width: iconWidth,
                color: iconColor,
              )
            : Icon(
                iconData,
                size: iconSize,
                color: iconColor,
              ));
  }

  @override
  widget({
    required Function runCode,
    required BuildContext context,
    String? title,
    String? icon,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? height,
    double? borderRadius,
    double? elevation,
    double? fontSize,
    double? width,
    double iconHeight = 22,
    double iconWidth = 22,
    double iconSize = 26,
    bool isSvg = true,
    bool isEnabled = true,
    bool hasTrailIcon = false,
    bool hasLeadIcon = true,
    bool isColorFiltered = true,
    bool? isFlexWidget,
    Color? backgroundColor,
    Color? borderColor,
    Color? iconColor,
    Color? titleColor,
    Widget? widgetBody,
    Widget? leadWidget,
    Widget? trailWidget,
    IconData? iconData,
    MainAxisAlignment iconButtonMainAxisAlignment = MainAxisAlignment.center,
  }) {
    return Container(
      margin: margin,
      height: height ?? Responsive.kButtonHeight,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          shape: borderRadius != null
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius))
              : null,
          elevation: elevation,
          backgroundColor: backgroundColor,
          side: BorderSide(color: borderColor ?? AppColors.kTRANSPARENT),
        ),
        onPressed: () {
          KeyboardAction.unfocus(context);
          runCode();
        },
        child: Row(
          mainAxisAlignment: iconButtonMainAxisAlignment,
          children: [
            if (hasLeadIcon || leadWidget != null) ...[
              customIconWidget(
                customIconWidget: leadWidget,
                icon: icon,
                iconColor: iconColor,
                iconData: iconData,
                iconHeight: iconHeight,
                iconSize: iconSize,
                iconWidth: iconWidth,
                isSvg: isSvg,
                context: context,
              ),
              kHSizedBox1,
            ],
            Flexible(
              child: FittedBox(
                child: widgetBody ??
                    CustomText(
                      text: "$title",
                      color: titleColor ?? AppColors.kWHITE,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
              ),
            ),
            if (hasTrailIcon || trailWidget != null) ...[
              kHSizedBox1,
              customIconWidget(
                customIconWidget: trailWidget,
                icon: icon,
                iconColor: iconColor,
                iconData: iconData,
                iconHeight: iconHeight,
                iconSize: iconSize,
                iconWidth: iconWidth,
                isSvg: isSvg,
                context: context,
              )
            ]
          ],
        ),
      ),
    );
  }
}

class CNormalButton implements CustomButton {
  @override
  widget({
    required Function runCode,
    required BuildContext context,
    String? title,
    String? icon,
    FontWeight? fontWeight,
    Widget? widgetBody,
    Widget? leadWidget,
    Widget? trailWidget,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? height,
    double? borderRadius,
    double? elevation,
    double? iconHeight,
    double? iconWidth,
    double? iconSize,
    double? fontSize,
    double? width,
    Color? borderColor,
    Color? iconColor,
    Color? backgroundColor,
    Color? titleColor,
    bool? isSvg,
    bool isEnabled = true,
    bool? hasTrailIcon,
    bool? hasLeadIcon,
    IconData? iconData,
    bool isFlexWidget = true,
    bool isColorFiltered = true,
    MainAxisAlignment? iconButtonMainAxisAlignment,
  }) {
    var buttonTitleColor = isEnabled
        ? titleColor ?? AppColors.kWHITE
        : context.textTheme.bodySmall?.color;
    return Container(
      margin: margin,
      height: height ?? Responsive.kButtonHeight,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          shape: borderRadius != null
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius))
              : null,
          elevation: isEnabled ? elevation : 0,
          backgroundColor:
              isEnabled ? backgroundColor : context.colors.secondaryBackground,
        ),
        onPressed: () {
          KeyboardAction.unfocus(context);
          if (isEnabled) {
            runCode();
          }
        },
        child: isFlexWidget
            ? FittedBox(
                child: widgetBody ??
                    CustomText(
                      text: "$title",
                      color: buttonTitleColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
              )
            : (widgetBody ??
                CustomText(
                  text: "$title",
                  color: buttonTitleColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                )),
      ),
    );
  }
}

class COutlinedButton implements CustomButton {
  Widget customIconWidget(
      {Widget? leadWidget,
      bool isSvg = true,
      String? icon,
      double? iconHeight,
      double? iconWidth,
      Color? iconColor,
      IconData? iconData,
      bool isColorFiltered = true,
      required BuildContext context,
      double? iconSize}) {
    return leadWidget ??
        (isSvg
            ? CustomSvgWidget(
                icon: icon ?? "",
                height: iconHeight,
                width: iconWidth,
                color: iconColor,
                isColorFiltered: isColorFiltered,
              )
            : Icon(
                iconData,
                size: iconSize,
                color: iconColor,
              ));
  }

  @override
  widget({
    required Function runCode,
    required BuildContext context,
    String? title,
    String? icon,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? height,
    double? borderRadius,
    double? elevation,
    double? iconHeight,
    double? iconWidth,
    double? iconSize,
    double? fontSize,
    double? width,
    Color? backgroundColor,
    Color? titleColor,
    Color? borderColor,
    Color? iconColor,
    Widget? widgetBody,
    Widget? leadWidget,
    Widget? trailWidget,
    bool isSvg = true,
    bool isEnabled = true,
    bool? isFlexWidget,
    bool? hasTrailIcon,
    bool hasLeadIcon = false,
    bool isColorFiltered = true,
    IconData? iconData,
    MainAxisAlignment? iconButtonMainAxisAlignment,
  }) {
    var constantPrimaryColor = context.colors.primary;
    return Container(
      margin: margin,
      height: height ?? Responsive.kButtonHeight,
      width: width ?? double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: padding,
          shape: borderRadius != null
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius))
              : null,
          backgroundColor: backgroundColor,
          side: BorderSide(color: borderColor ?? constantPrimaryColor!),
        ),
        onPressed: () {
          KeyboardAction.unfocus(context);
          runCode();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasLeadIcon) ...[
              customIconWidget(
                leadWidget: leadWidget,
                icon: icon,
                iconColor: iconColor,
                iconData: iconData,
                iconHeight: iconHeight,
                iconSize: iconSize,
                iconWidth: iconWidth,
                isSvg: isSvg,
                context: context,
                isColorFiltered: isColorFiltered,
              ),
              kHSizedBox1,
            ],
            Flexible(
              child: CustomText(
                text: "$title",
                color: titleColor ?? constantPrimaryColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CTextButton implements CustomButton {
  @override
  widget({
    required Function runCode,
    required BuildContext context,
    String? title,
    String? icon,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? height,
    double? borderRadius,
    double? fontSize,
    double? width,
    double? elevation,
    double? iconHeight,
    double? iconWidth,
    double? iconSize,
    Color? backgroundColor,
    Color? borderColor,
    Color? titleColor,
    Color? iconColor,
    Widget? widgetBody,
    Widget? leadWidget,
    Widget? trailWidget,
    bool? isSvg,
    bool isEnabled = true,
    bool? isFlexWidget,
    bool? hasTrailIcon,
    bool? hasLeadIcon,
    IconData? iconData,
    bool isColorFiltered = true,
    MainAxisAlignment? iconButtonMainAxisAlignment,
  }) {
    return Container(
      margin: margin,
      height: height ?? Responsive.kButtonHeight,
      width: width ?? double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding,
          shape: borderRadius != null
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius))
              : null,
          backgroundColor: backgroundColor,
        ),
        onPressed: () {
          KeyboardAction.unfocus(context);
          runCode();
        },
        child: widgetBody ??
            CustomText(
              text: "$title",
              color: titleColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}

abstract class CustomButton {
  factory CustomButton({ButtonType buttonType = ButtonType.normal}) {
    return switch (buttonType) {
      ButtonType.normal => CNormalButton(),
      ButtonType.outline => COutlinedButton(),
      ButtonType.icon => CIconButton(),
      ButtonType.text => CTextButton(),
    };
  }

  widget({
    required final BuildContext context,
    required final Function runCode,
    final String? title,
    final String? icon,
    final FontWeight? fontWeight,
    final EdgeInsetsGeometry? margin,
    final EdgeInsetsGeometry? padding,
    final double? height,
    final double? borderRadius,
    final double? fontSize,
    final double? width,
    final double? elevation,
    final double iconHeight,
    final double iconWidth,
    final double iconSize,
    final Color? backgroundColor,
    final Color borderColor,
    final Color? iconColor,
    final Color? titleColor,
    final Widget? widgetBody,
    final Widget? leadWidget,
    final Widget? trailWidget,
    final bool isSvg,
    final bool isEnabled,
    final bool isFlexWidget,
    final bool hasTrailIcon,
    final bool hasLeadIcon,
    final IconData? iconData,
    final bool isColorFiltered,
    final MainAxisAlignment iconButtonMainAxisAlignment,
  });
}
