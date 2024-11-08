import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/icons.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';

import 'custom_svg_widget.dart';
import 'custom_text_field_widget.dart';

class CustomSearchTextFormWidget extends StatelessWidget {
  final Function? onChanged;
  final bool showSuffixIcon;
  final bool readOnly;
  final Function()? onSuffixTap;
  final Function()? onTap;
  final TextEditingController? textEditingController;
  final bool isVisible;
  final bool autofocus;
  final FocusNode? focusNode;
  final String? hintText;

  const CustomSearchTextFormWidget({
    super.key,
    required this.onChanged,
    this.onTap,
    this.showSuffixIcon = false,
    this.textEditingController,
    this.onSuffixTap,
    this.isVisible = true,
    this.autofocus = false,
    this.readOnly = false,
    this.focusNode,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: CustomTextFieldWidget(
        onTap: onTap,
        readOnly: readOnly,
        textEditingController: textEditingController,
        focusNode: focusNode,
        autofocus: autofocus,
        isMandatory: false,
        hintText: hintText ?? "Search here",
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.done,
        isSearch: true,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        onChanged: onChanged,
        suffix: showSuffixIcon
            ? CustomSvgWidget(
                onTap: onSuffixTap,
                icon: kSettingsIcon,
                height: 20,
                color: context.colors.primary,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
