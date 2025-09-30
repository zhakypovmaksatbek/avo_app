import 'package:auto_route/auto_route.dart';
import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/main.dart';
import 'package:avo/presentation/pages/splash/core/data/onboarding_data.dart';
import 'package:avo/presentation/widgets/image/custom_asset_image.dart';
import 'package:avo/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "OnboardingRoute")
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void onSkip() {
    router.replaceAll([const OtpRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xffF2F2F7),
      body: PageView.builder(
        controller: _pageController,
        itemCount: OnboardingData.onboarding.length,
        itemBuilder: (context, index) {
          final onboarding = OnboardingData.onboarding[index];
          return CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                child: Container(
                  color: index == 0 ? Color(0xffF2F2F7) : theme.primaryColor,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: size.height * getHeight(index),
                        child: CustomAssetImage(
                          path: onboarding.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 24,
                          ),
                          height: size.height * .4,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: Offset(0, -10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            spacing: 4,
                            children: [
                              IconButton.filled(
                                padding: EdgeInsets.zero,
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      theme.inputDecorationTheme.fillColor,
                                  foregroundColor: theme.iconTheme.color,
                                  maximumSize: Size(30, 30),
                                  minimumSize: Size(30, 30),
                                  iconSize: 20,
                                  shape: CircleBorder(),
                                ),
                                onPressed: () {
                                  if (index > 0) {
                                    _pageController.previousPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                icon: Icon(Icons.arrow_back_ios_new_rounded),
                              ),
                              Text(
                                onboarding.title,
                                style: theme.textTheme.headlineSmall,
                              ),
                              Text(
                                onboarding.description,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 24),
                                width: size.width,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (index <
                                        OnboardingData.onboarding.length - 1) {
                                      _pageController.nextPage(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    } else {
                                      onSkip();
                                    }
                                  },
                                  child: Text(
                                    index ==
                                            OnboardingData.onboarding.length - 1
                                        ? LocaleKeys.buttons_go_to_register.tr()
                                        : LocaleKeys.buttons_next.tr(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (index != OnboardingData.onboarding.length - 1)
                        Align(
                          alignment: Alignment.topRight,
                          child: SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: ElevatedButton(
                                onPressed: onSkip,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.scaffoldBackgroundColor
                                      .withValues(alpha: 0.4),
                                  foregroundColor:
                                      theme.scaffoldBackgroundColor,
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                                child: Text(LocaleKeys.buttons_skip.tr()),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  double getHeight(int index) {
    switch (index) {
      case 0:
        return .73;
      case 1:
        return .6;
      default:
        return .65;
    }
  }
}
