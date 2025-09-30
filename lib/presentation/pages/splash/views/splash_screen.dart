import 'package:auto_route/auto_route.dart';
import 'package:avo/main.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/presentation/utils/asset_util.dart';
import 'package:avo/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(name: "SplashRoute")
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _onboarding();
  }

  Future<void> _onboarding() async {
    await Future.delayed(const Duration(seconds: 2));
    router.replace(const DashboardRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(child: SvgPicture.asset(AssetUtil.logoWhiteSvg)),
    );
  }
}
