import 'package:auto_route/auto_route.dart';
import 'package:avo/presentation/pages/auth/views/otp_page.dart';
import 'package:avo/presentation/pages/auth/views/verify_page.dart';
import 'package:avo/presentation/pages/dashboard/dashboard_page.dart';
import 'package:avo/presentation/pages/favorites/favorites_page.dart';
import 'package:avo/presentation/pages/home/views/home_page.dart';
import 'package:avo/presentation/pages/orders/orders_page.dart';
import 'package:avo/presentation/pages/profile/views/profile_page.dart';
import 'package:avo/presentation/pages/splash/views/onboarding_page.dart';
import 'package:avo/presentation/pages/splash/views/splash_screen.dart';
import 'package:flutter/material.dart';

part "app_router.gr.dart";

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: "/", initial: true),
    AutoRoute(page: OnboardingRoute.page, path: "/onboarding"),
    AutoRoute(page: OtpRoute.page, path: "/otp"),
    AutoRoute(page: VerifyRoute.page, path: "/verify"),
    AutoRoute(
      page: DashboardRoute.page,
      path: "/dashboard",
      children: [
        AutoRoute(page: HomeRoute.page, path: "home", initial: true),
        AutoRoute(page: FavoritesRoute.page, path: "favorites"),
        AutoRoute(page: OrdersRoute.page, path: "orders"),
        AutoRoute(page: ProfileRoute.page, path: "profile"),
      ],
    ),
  ];
}
