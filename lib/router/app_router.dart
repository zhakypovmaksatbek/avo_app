import 'package:auto_route/auto_route.dart';
import 'package:avo/presentation/pages/splash/splash_screen.dart';

part "app_router.gr.dart";

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: "/", initial: true),
  ];
}
