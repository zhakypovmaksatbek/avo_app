import 'package:avo/presentation/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      secondary: AppColor.secondary,
      surface: AppColor.white,
      onSurface: AppColor.secondary,
    ),
    scaffoldBackgroundColor: AppColor.white,
    disabledColor: AppColor.disabled.withValues(alpha: 0.3),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColor.fill,
      filled: true,
    ),
  );
}
