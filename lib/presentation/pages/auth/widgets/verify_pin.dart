// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class VerifyPinPutWidget extends StatelessWidget {
  const VerifyPinPutWidget({
    super.key,
    required this.controller,
    this.validator,
    this.onCompleted,
    this.errorText,
    this.length,
    this.useNativeKeyboard = true,
    this.onChanged,
    this.obscureText = false,
    required this.focusNode,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onCompleted;
  final String? errorText;
  final int? length;
  final bool? useNativeKeyboard;
  final void Function(String)? onChanged;
  final FocusNode focusNode;
  final bool obscureText;

  PinTheme defaultPinTheme(BuildContext context) {
    return PinTheme(
      textStyle: TextStyle(
        fontSize: 18,
        // fontFamily: AppConst.fontFamilyOpenSans,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).iconTheme.color,
      ),
      constraints: BoxConstraints(
        minWidth: 48,
        minHeight: 48,
        maxWidth: 48,
        maxHeight: 48,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Theme.of(context).inputDecorationTheme.fillColor,
      ),
    );
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.forms_enter_verification_code.tr();
    }
    if (value.length != (length ?? 4)) {
      return LocaleKeys.forms_enter_verification_code.tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Pinput(
            useNativeKeyboard: useNativeKeyboard!,
            length: length ?? 4,
            crossAxisAlignment: CrossAxisAlignment.center,
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText,
            defaultPinTheme: hasError
                ? defaultPinTheme(context).copyDecorationWith(
                    border: Border.all(color: theme.colorScheme.error),
                    borderRadius: BorderRadius.circular(radius),
                  )
                : defaultPinTheme(context),
            separatorBuilder: (index) => const SizedBox(width: 20),
            onTapOutside: (event) {
              focusNode.unfocus();
            },
            validator: validator ?? validate,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: onCompleted,
            autofocus: true,
            toolbarEnabled: true,
            keyboardType: TextInputType.number,
            onChanged: onChanged,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            cursor: Center(
              child: Container(width: 2, height: 18, color: theme.primaryColor),
            ),
            pinAnimationType: PinAnimationType.fade,
            focusedPinTheme: defaultPinTheme(context).copyWith(
              decoration: defaultPinTheme(context).decoration!.copyWith(
                color: theme.inputDecorationTheme.fillColor,
                border: Border.all(
                  color: hasError
                      ? theme.colorScheme.error
                      : theme.primaryColor,
                ),
              ),
            ),
            submittedPinTheme: hasError
                ? defaultPinTheme(context).copyDecorationWith(
                    border: Border.all(color: theme.colorScheme.error),
                    borderRadius: BorderRadius.circular(radius),
                  )
                : defaultPinTheme(context),
            errorPinTheme: defaultPinTheme(context).copyDecorationWith(
              border: Border.all(color: theme.colorScheme.error),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              errorText!,
              style: TextStyle(color: theme.colorScheme.error, fontSize: 12),
            ),
          ),
        ],
      ],
    );
  }

  static const double radius = AppDimens.radiusLarge;
}
