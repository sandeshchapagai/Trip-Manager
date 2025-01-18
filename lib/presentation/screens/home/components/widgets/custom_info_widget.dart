import 'package:flutter/cupertino.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';

import '../../../../../core/app/constants/dimensions.dart';
import '../../../../../core/app/constants/font_size.dart';
import '../../../../../core/app/constants/icons.dart';
import '../../../../../core/app/constants/styles.dart';
import '../../../../widgets/custom_svg_widget.dart';

class CustomInfoWidget extends StatelessWidget {
  final String firstText;
  final String? secondText;
  final String trialingText;
  final Function()? onTap;

  const CustomInfoWidget(
      {super.key,
      required this.firstText,
      required this.trialingText,
      this.onTap,
      this.secondText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomText(
              text: firstText,
              fontWeight: FontWeight.w600,
              fontSize: FontSize.kS16,
            ),
            kHSizedBox1,
            CustomText(
              decorationColor: context.colors.green,
              color: context.colors.primary,
              text: secondText ?? "",
              fontWeight: FontWeight.w600,
              fontSize: FontSize.kS16,
            ),
          ],
        ),
        Row(
          children: [
            CustomText(
              text: trialingText,
              fontWeight: FontWeight.w500,
            ),
            CustomSvgWidget(
              icon: kChevronRightIcon,
              height: 20,
            )
          ],
        )
      ],
    );
  }
}
