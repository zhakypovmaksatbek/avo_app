import 'dart:ui';

import 'package:avo/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';

final class AppLocalization extends EasyLocalization {
  AppLocalization({super.key, required super.child})
    : super(
        path: localePath,
        fallbackLocale: Locales.ru.locale,
        startLocale: Locales.ru.locale,
        useOnlyLangCode: true,
        supportedLocales: Locales.values.map((e) => e.locale).toList(),
        assetLoader: const CodegenLoader(),
      );

  static const String localePath = 'assets/translations';
}

enum Locales {
  ru(Locale('ru'));

  final Locale locale;
  const Locales(this.locale);
}
