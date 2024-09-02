import 'package:flutter/material.dart';

import '../../core/app/constants/colors.dart';
import '../../core/app/constants/dimensions.dart';
import '../../core/app/constants/font_size.dart';
import '../../core/app/constants/icons.dart';
import '../../core/utils/theme_extensions.dart';
import 'custom_svg_widget.dart';

class CustomMandatoryTitleWidget extends StatelessWidget {
  final String? title, subTitle;
  final bool isMandatory;
  final double? fontSize;
  final Color? color;
  final bool isVerified;
  final Widget? titleTrailingWidget, titleLeadingWidget;
  const CustomMandatoryTitleWidget({
    super.key,
    this.title,
    this.subTitle,
    this.isMandatory = false,
    this.isVerified = false,
    this.fontSize,
    this.color,
    this.titleTrailingWidget,
    this.titleLeadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text.rich(
              TextSpan(
                text: title,
                children: [
                  if (title != null && isMandatory == true) ...[
                    TextSpan(
                      text: ' *',
                      style: context.textTheme.labelLarge?.copyWith(
                        fontSize: fontSize ?? FontSize.kS15,
                        color: AppColors.kERROR,
                      ),
                    ),
                  ],
                  if (subTitle != null)
                    TextSpan(
                      text: subTitle,
                      style: context.textTheme.labelMedium
                          ?.copyWith(fontSize: FontSize.kS13),
                    ),
                ],
              ),
              style: context.textTheme.labelLarge?.copyWith(
                fontSize: fontSize ?? FontSize.kS15,
                color: color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (titleLeadingWidget != null) ...[
              kHSizedBox0,
              titleLeadingWidget ?? const SizedBox.shrink()
            ],
            if (isVerified) ...[
              const SizedBox(width: 3),
              CustomSvgWidget(
                icon: kGreenCircleCheckIcon,
                height: 13,
                color: context.colors.darkGreen,
              ),
            ],
          ],
        ),
        if (titleTrailingWidget != null) ...[
          titleTrailingWidget ?? const SizedBox.shrink()
        ]
      ],
    );
  }
}
