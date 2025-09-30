import 'package:auto_route/auto_route.dart';
import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/main.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/const/asset_const.dart';
import 'package:avo/presentation/pages/auth/widgets/custom_phone_input.dart';
import 'package:avo/presentation/widgets/image/custom_asset_image.dart';
import 'package:avo/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "OtpRoute")
class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late final TextEditingController phoneController;
  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 600 || screenWidth < 400;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(
            isSmallScreen ? AppDimens.paddingMedium : AppDimens.paddingLarge,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  screenHeight -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  (isSmallScreen
                      ? AppDimens.paddingMedium * 2
                      : AppDimens.paddingLarge * 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: isSmallScreen
                      ? AppDimens.paddingMedium
                      : AppDimens.paddingLarge,
                ),
                CustomAssetImage(
                  path: AssetConst.svgLogo,
                  height: isSmallScreen ? 32 : 38,
                ),
                Column(
                  spacing: AppDimens.paddingTiny,
                  children: [
                    Text(
                      LocaleKeys.forms_enter_phone_number_for_login.tr(),
                      style: theme.textTheme.headlineSmall,
                    ),
                    Text(
                      LocaleKeys.forms_login_description.tr(),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: isSmallScreen
                            ? AppDimens.paddingLarge
                            : AppDimens.paddingExtra,
                      ),
                      child: CustomPhoneInput(
                        controller: phoneController,

                        onInputChanged: (value, country) {},
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        router.push(
                          VerifyRoute(phone: " +996 ${phoneController.text}"),
                        );
                      },
                      child: Center(child: Text(LocaleKeys.buttons_next.tr())),
                    ),
                  ],
                ),
                Column(
                  spacing: isSmallScreen
                      ? AppDimens.paddingTiny
                      : AppDimens.paddingSmall,
                  children: [
                    Row(
                      spacing: AppDimens.paddingSmall,
                      children: [
                        const Expanded(child: Divider()),
                        Text(LocaleKeys.general_or_try_through.tr()),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Center(child: Text("WhatsApp")),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Center(child: Text("Telegram")),
                    ),
                  ],
                ),
                SizedBox(
                  height: isSmallScreen
                      ? AppDimens.paddingMedium
                      : AppDimens.paddingLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
