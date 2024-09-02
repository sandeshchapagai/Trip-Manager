import 'package:flutter/material.dart';

import '../../core/app/constants/dimensions.dart';
import '../../core/app/constants/styles.dart';
import '../../core/routes/route_navigator.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/theme_extensions.dart';
import 'custom_svg_widget.dart';

class ApplicationAppBar {
  static AppBar customAppBarWidget({
    String? title,
    required BuildContext context,
    List<Widget>? trailing,
    Widget? leading,
    bool? isTitleWidget = false,
    bool? centerTitle = true,
    bool isMainBaseAppBar = false,
    FontWeight? fontWeight = FontWeight.normal,
    Widget? titleWidget,
    TextStyle? textStyle,
  }) {
    return AppBar(
      leadingWidth: isMainBaseAppBar ? 0 : null,
      toolbarHeight: Responsive.kAppToolbarHeight,
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: isTitleWidget == true
            ? titleWidget
            : CustomText(
                text: title ?? "",
                style: textStyle ?? context.appBarTheme.titleTextStyle,
              ),
      ),
      leading: leading ?? const SizedBox(),
      actions: trailing ?? [],
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  static PreferredSize customChildAppBarWidget(
          {Function()? onBackTap,
          String title = "",
          Widget? trailing,
          required BuildContext context}) =>
      PreferredSize(
        preferredSize: Size(appWidth(context), appHeight(context) * .07),
        child: customAppBarWidget(
          context: context,
          centerTitle: false,
          isMainBaseAppBar: true,
          isTitleWidget: true,
          titleWidget: Container(
            margin: const EdgeInsets.only(top: 7),
            child: Row(
              children: [
                InkWell(
                  onTap: onBackTap ?? () => RouteNavigator.back(context),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 4, right: 6),
                    decoration: BoxDecoration(
                        border: Border.all(color: context.dividerTheme.color!),
                        borderRadius: BorderRadius.circular(9)),
                    child: CustomSvgWidget(
                      icon: '',
                      height: 23,
                      color: context.colors.primary,
                    ),
                  ),
                ),
                kHSizedBox1,
                const SizedBox(width: 3),
                Expanded(
                  flex: 3,
                  child: CustomText(
                    text: title,
                    textAlign: TextAlign.start,
                    style: context.appBarTheme.titleTextStyle,
                  ),
                ),
                if (trailing != null) ...[
                  kHSizedBox1,
                  trailing,
                ],
              ],
            ),
          ),
        ),
      );
}
