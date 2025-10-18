import 'package:avo/presentation/const/app_const.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:flutter/material.dart';

class AppTextTheme extends TextTheme {
  @override
  TextStyle? get headlineSmall => const TextStyle(
    fontSize: AppDimens.fontSizeLargeMedium,
    fontWeight: FontWeight.w600,
    fontFamily: AppConst.fontFamily,
  );

  @override
  TextStyle? get titleLarge => TextStyle(
    fontSize: AppDimens.fontSizeMediumLarge,
    fontWeight: FontWeight.w600,
    fontFamily: AppConst.fontFamily,
  );

  @override
  TextStyle? get titleMedium => TextStyle(
    fontSize: AppDimens.fontSizeMedium,
    fontFamily: AppConst.fontFamily,
  );

  @override
  TextStyle? get bodyMedium => TextStyle(
    fontSize: AppDimens.fontSizeSmallLarge,
    fontFamily: AppConst.fontFamily,
  );

  @override
  TextStyle? get bodySmall => TextStyle(
    fontSize: AppDimens.fontSizeSmall,
    fontFamily: AppConst.fontFamily,
  );
}
