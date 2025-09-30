import 'package:auto_route/annotations.dart';
import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/main.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/const/asset_const.dart';
import 'package:avo/presentation/pages/auth/core/utils/keyboard_action_config.dart';
import 'package:avo/presentation/pages/auth/widgets/resend_timer.dart';
import 'package:avo/presentation/pages/auth/widgets/verify_pin.dart';
import 'package:avo/presentation/widgets/image/custom_asset_image.dart';
import 'package:avo/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

@RoutePage(name: "VerifyRoute")
class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key, required this.phone});
  final String phone;
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  late final TextEditingController _codeController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _codeFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 600 || screenWidth < 400;
    return Scaffold(
      appBar: AppBar(
        actions: [
          CloseButton(),
          SizedBox(width: AppDimens.paddingSmall),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppDimens.paddingSmall,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ResendTimer(onResend: () {}),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  router.replaceAll([const DashboardRoute()]);
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
              child: Text(LocaleKeys.buttons_done.tr()),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppDimens.paddingLarge,
            left: AppDimens.paddingLarge,
            right: AppDimens.paddingLarge,
          ),
          child: KeyboardActions(
            config: KeyboardActionConfig().buildConfig(context, [
              _codeFocusNode,
            ]),
            child: Column(
              spacing: AppDimens.paddingSmall,
              children: [
                CustomAssetImage(path: AssetConst.svgLogo, height: 38),
                SizedBox(
                  height: isSmallScreen
                      ? screenHeight * 0.05
                      : screenHeight * 0.1,
                ),
                Text(
                  LocaleKeys.forms_enter_verification_code.tr(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .forms_enter_verification_code_description
                            .tr(),
                      ),
                      TextSpan(
                        text: widget.phone,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                VerifyPinPutWidget(
                  controller: _codeController,
                  length: 4,
                  focusNode: _codeFocusNode,
                  onCompleted: (value) {
                    // Code is complete, you can handle it here if needed
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
