import 'package:avo/presentation/const/app_dimens.dart';
import 'package:flutter/material.dart';

class AppTextTheme extends TextTheme {
  @override
  TextStyle? get headlineSmall => const TextStyle(
    fontSize: AppDimens.fontSizeLargeMedium,
    fontWeight: FontWeight.w600,
  );

  @override
  TextStyle? get titleLarge => TextStyle(
    fontSize: AppDimens.fontSizeMediumLarge,
    fontWeight: FontWeight.w600,
  );

  @override
  TextStyle? get titleMedium => TextStyle(fontSize: AppDimens.fontSizeMedium);

  @override
  TextStyle? get bodyMedium =>
      TextStyle(fontSize: AppDimens.fontSizeSmallLarge);

  @override
  TextStyle? get bodySmall => TextStyle(fontSize: AppDimens.fontSizeSmall);
}
