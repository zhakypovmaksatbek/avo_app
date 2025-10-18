import 'package:avo/presentation/const/app_const.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/presentation/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      surface: AppColor.white,
    ),
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    appBarTheme: AppBarThemeData(
      centerTitle: true,
      backgroundColor: AppColor.white,
      foregroundColor: AppColor.secondary,
      titleTextStyle: TextStyle(
        fontFamily: AppConst.fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: AppColor.secondary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
    ),
    fontFamily: AppConst.fontFamily,
    bottomAppBarTheme: BottomAppBarThemeData(color: AppColor.white),
    disabledColor: AppColor.disabled.withValues(alpha: 0.6),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColor.backgroundColor,
      filled: true,

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primary),
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    textTheme: AppTextTheme().copyWith(
      bodySmall: AppTextTheme().bodySmall?.copyWith(
        color: AppColor.secondary.withValues(alpha: 0.6),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.white,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,

      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: AppColor.secondary,
      unselectedItemColor: AppColor.secondary.withValues(alpha: 0.6),
      selectedLabelStyle: AppTextTheme().bodySmall?.copyWith(
        color: AppColor.secondary,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppTextTheme().bodySmall?.copyWith(
        color: AppColor.secondary.withValues(alpha: 0.6),
      ),
    ),
    chipTheme: ChipThemeData(
      labelStyle: AppTextTheme().bodySmall?.copyWith(
        color: AppColor.secondary,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
      ),
    ),
  );
}
