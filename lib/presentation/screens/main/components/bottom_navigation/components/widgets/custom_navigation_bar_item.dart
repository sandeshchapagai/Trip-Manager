import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../../core/utils/theme_extensions.dart';
import '../../../../../../widgets/custom_svg_widget.dart';

BottomNavigationBarItem buildNavbarItem(
    {required String? text,
    required String icon,
    required BuildContext context,
    bool visibility = true}) {
  var iconSize = 20.0;
  return BottomNavigationBarItem(
    icon: Visibility(
      visible: visibility,
      child: CustomSvgWidget(
          icon: icon,
          color: context.bottomNavigationBarTheme.unselectedItemColor,
          height: iconSize,
          width: iconSize),
    ),
    activeIcon: Visibility(
      visible: visibility,
      child: CustomSvgWidget(
          icon: icon,
          color: context.bottomNavigationBarTheme.selectedItemColor,
          height: iconSize,
          width: iconSize),
    ),
    label: text ?? '',
  );
}
