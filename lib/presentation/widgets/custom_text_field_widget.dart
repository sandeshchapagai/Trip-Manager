import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app/constants/colors.dart';
import '../../core/app/constants/dimensions.dart';
import '../../core/app/constants/icons.dart';
import '../../core/app/constants/styles.dart';
import '../../core/config/regex_config.dart';
import '../../core/utils/limit_text_field_number.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/text_formatter.dart';
import '../../core/utils/theme_extensions.dart';
import 'custom_mandatory_title_widget.dart';
import 'custom_svg_widget.dart';

// ignore: must_be_immutable
class CustomTextFieldWidget extends StatelessWidget {
  TextEditingController? textEditingController = TextEditingController();
  final String? hintText,
      emptyMessage,
      validateMessage,
      initialValue,
      title,
      prefixText;

  final bool? enableInteractiveSelection;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final AutovalidateMode autovalidateMode;
  final Function? validator, onsaved;
  final bool isEnabled,
      isPassword,
      autofocus,
      isUpdate,
      doDecimalInputFormatter,
      doNumberInputFormatter,
      doNumberLimitInputFormatter,
      doUpperCaseInputFormatter,
      doCapitalizeInputFormatter,
      denySpaceInputFormatter,
      doNumberWithSpaceInputFormatter,
      doPhoneNumberInputFormatter,
      showTitle,
      isMandatory,
      readOnly,
      isSearch,
      filled,
      isVerified,
      hasPrefixSuffixPadding;
  final double? numLimitRange, titleFontSize;
  final Function? onChanged;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Widget? prefix,
      suffix,
      titleTrailingWidget,
      titleLeadingWidget,
      notifyWidget;
  final Color? fillcolor, borderColor;
  final int? maxline, maxLength;
  final FilteringTextInputFormatter? textInputFormatter;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;

  CustomTextFieldWidget({
    super.key,
    this.textEditingController,
    this.textInputFormatter,
    this.textAlign,
    this.hintText,
    this.borderColor,
    this.notifyWidget,
    this.titleTrailingWidget,
    this.titleLeadingWidget,
    this.maxLength,
    this.showTitle = true,
    this.doNumberWithSpaceInputFormatter = false,
    this.emptyMessage,
    this.enableInteractiveSelection,
    this.prefixText,
    this.numLimitRange,
    this.denySpaceInputFormatter = false,
    this.doNumberInputFormatter = false,
    this.doPhoneNumberInputFormatter = false,
    this.doUpperCaseInputFormatter = false,
    this.doCapitalizeInputFormatter = false,
    this.hasPrefixSuffixPadding = true,
    this.isSearch = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validateMessage,
    this.doDecimalInputFormatter = false,
    this.doNumberLimitInputFormatter = false,
    this.isVerified = false,
    this.focusNode,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onsaved,
    this.titleFontSize,
    this.isPassword = false,
    this.suffix,
    this.initialValue,
    this.title,
    this.isEnabled = true,
    this.prefix,
    this.autofocus = false,
    this.fillcolor,
    this.filled = false,
    this.isUpdate = false,
    this.isMandatory = true,
    this.onChanged,
    this.onTap,
    this.maxline = 1,
    this.contentPadding = Responsive.textFieldContentPadding,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showTitle && title != null) ...[
          Align(
            alignment: Alignment.topLeft,
            child: CustomMandatoryTitleWidget(
              isMandatory: isMandatory,
              title: title,
              fontSize: titleFontSize,
              isVerified: isVerified,
              titleTrailingWidget: titleTrailingWidget,
              titleLeadingWidget: titleLeadingWidget,
            ),
          ),
          kVSizedBox1
        ],
        if (notifyWidget != null) ...[
          notifyWidget ?? const SizedBox(),
          kVSizedBox1,
        ],
        TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength ?? 50),
            FilteringTextInputFormatter.deny(RegexConfig.blockEmojis()),
            if (doDecimalInputFormatter) ...[
              FilteringTextInputFormatter.allow(
                  RegexConfig.digitAndDecimalOnly())
            ],
            if (doPhoneNumberInputFormatter) ...[
              PhoneNumberFormatter(),
            ],
            if (doNumberInputFormatter) ...[
              FilteringTextInputFormatter.allow(RegexConfig.digitOnly())
            ],
            if (doNumberWithSpaceInputFormatter) ...[
              FilteringTextInputFormatter.allow(
                  RegexConfig.digitWithSpaceOnly())
            ],
            if (doNumberLimitInputFormatter) ...[
              LimitRange(range: numLimitRange ?? 1000),
            ],
            if (doUpperCaseInputFormatter) ...[
              UpperCaseTextFormatter(),
            ],
            if (doCapitalizeInputFormatter) ...[
              CapitalizeTextFormatter(),
            ],
            if (denySpaceInputFormatter) ...[
              FilteringTextInputFormatter.deny(RegexConfig.denySpace())
            ],
          ],
          cursorColor: context.colors.primary,
          textAlign: textAlign ?? TextAlign.start,
          enabled: isEnabled,
          onTap: onTap,
          autovalidateMode: autovalidateMode,
          autocorrect: true,
          maxLines: maxline,
          textInputAction: textInputAction,
          keyboardType: doDecimalInputFormatter
              ? const TextInputType.numberWithOptions(
                  decimal: true,
                )
              : doNumberInputFormatter ||
                      doNumberWithSpaceInputFormatter ||
                      doNumberLimitInputFormatter
                  ? TextInputType.number
                  : textInputType,
          obscureText: isPassword,
          controller: textEditingController,
          autofocus: autofocus,
          initialValue: initialValue,
          readOnly: readOnly,
          focusNode: focusNode,
          enableInteractiveSelection: enableInteractiveSelection,
          style: customTextStyle(),
          decoration: InputDecoration(
            counterText: '',
            isDense: true,
            prefixIcon: isSearch
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kHBox1),
                    child: CustomSvgWidget(
                      icon: kSearchIcon,
                    ),
                  )
                : prefix != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: hasPrefixSuffixPadding ? kHBox1 : 0),
                        child: prefix,
                      )
                    : kHSizedBox1,
            prefixText: prefixText,
            fillColor: fillcolor ?? context.colors.inputFilled,
            suffixIcon: suffix != null
                ? Padding(
                    padding: EdgeInsets.only(
                        right: hasPrefixSuffixPadding ? kHBox1 : 0),
                    child: suffix,
                  )
                : null,
            filled: filled,
            errorMaxLines: 2,
            focusedBorder: context.inputDecorationTheme.focusedBorder?.copyWith(
              borderSide: filled
                  ? isSearch
                      ? context.inputDecorationTheme.focusedBorder?.borderSide
                          .copyWith(width: .7, color: borderColor)
                      : BorderSide.none
                  : context.inputDecorationTheme.focusedBorder?.borderSide
                      .copyWith(
                          width: isSearch ? .7 : null, color: borderColor),
            ),
            enabledBorder: context.inputDecorationTheme.enabledBorder?.copyWith(
              borderSide: filled
                  ? isSearch
                      ? context.inputDecorationTheme.focusedBorder?.borderSide
                          .copyWith(width: .7, color: borderColor)
                      : BorderSide.none
                  : context.inputDecorationTheme.enabledBorder?.borderSide
                      .copyWith(
                          width: isSearch ? .7 : null, color: borderColor),
            ),
            border: context.inputDecorationTheme.border
                ?.copyWith(borderSide: filled ? BorderSide.none : null),
            errorBorder: context.inputDecorationTheme.errorBorder
                ?.copyWith(borderSide: filled ? BorderSide.none : null),
            disabledBorder: context.inputDecorationTheme.disabledBorder
                ?.copyWith(borderSide: filled ? BorderSide.none : null),
            contentPadding: contentPadding,
            hintText: hintText ?? "",
            label: !showTitle
                ? Text.rich(
                    TextSpan(
                      text: title,
                      children: [
                        if (title != null && isMandatory == true) ...[
                          TextSpan(
                            text: '*',
                            style: customTextStyle(
                              color: AppColors.kERROR,
                            ),
                          ),
                        ]
                      ],
                    ),
                  )
                : null,
            prefixIconConstraints:
                const BoxConstraints(minHeight: 1, minWidth: 1),
            suffixIconConstraints:
                const BoxConstraints(minHeight: 1, minWidth: 1),
          ),
          onChanged: (val) => onChanged != null ? onChanged!(val) : null,
          onSaved: (val) => onsaved != null ? onsaved!(val) : null,
          validator: (val) => validator == null ? null : validator!(val),
        ),
      ],
    );
  }
}
