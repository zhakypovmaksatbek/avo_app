import 'package:avo/presentation/localization/app_localization.dart';
import 'package:avo/presentation/theme/app_theme.dart';
import 'package:avo/router/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupLocator();
  runApp(
    AppLocalization(
      child: DevicePreview(enabled: false, builder: (context) => const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Material App',
    );
  }
}

final router = getIt<AppRouter>();

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
