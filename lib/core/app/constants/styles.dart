import 'package:flutter/material.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';

import 'app_text.dart';

TextStyle customTextStyle(
    {FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? txtDecoration = TextDecoration.none,
    double letterSpacing = 0,
    final double? textHeight}) {
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    decoration: txtDecoration,
    color: color,
    letterSpacing: letterSpacing,
    overflow: textOverflow,
    fontFamily: AppText.fontFamily,
    height: textHeight,
  );
}

class CustomRichText extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final Color? firstColor, secondColor;
  final TextStyle? style;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;
  final TextAlign textAlign;
  final List<TextSpan>? customTextSpans;

  const CustomRichText({
    super.key,
    this.firstText,
    this.secondText,
    this.style,
    this.firstTextStyle,
    this.secondTextStyle,
    this.textAlign = TextAlign.center,
    this.firstColor,
    this.secondColor,
    this.customTextSpans,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: textAlign,
      TextSpan(
        style: style ?? context.textTheme.titleMedium,
        children: customTextSpans ??
            [
              TextSpan(
                text: firstText,
                style: firstTextStyle ??
                    customTextStyle(
                      color: firstColor,
                    ),
              ),
              TextSpan(
                text: secondText,
                style: secondTextStyle ??
                    customTextStyle(
                      color: secondColor,
                    ),
              ),
            ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final Color? color, decorationColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double letterSpacing;
  final int? maxLines;
  final TextOverflow textOverflow;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextStyle? style;
  final Function()? onTap;
  final EdgeInsetsGeometry padding;
  final double? textHeight;

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.letterSpacing = 0.1,
    this.maxLines,
    this.textOverflow = TextOverflow.ellipsis,
    this.shadows,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.justify,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.style,
    this.textHeight,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: Text(
            text,
            textAlign: textAlign,
            style: style ??
                context.textTheme.bodyMedium?.copyWith(
                    color: color,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    height: textHeight,
                    decoration: textDecoration,
                    decorationColor: decorationColor),
            maxLines: maxLines,
            overflow: maxLines != null ? textOverflow : null,
          ),
        ));
  }
}
