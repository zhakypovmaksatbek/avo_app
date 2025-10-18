import 'package:auto_route/auto_route.dart';
import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/const/asset_const.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/presentation/widgets/image/custom_asset_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'QRRoute')
class QRPage extends StatelessWidget {
  const QRPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColor.secondary,
      appBar: AppBar(
        foregroundColor: AppColor.white,
        backgroundColor: AppColor.secondary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingExtra),
        child: Column(
          spacing: AppDimens.paddingTiny,
          children: [
            Text(
              LocaleKeys.titles_balance.tr(),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColor.white,
              ),
            ),
            Text(
              LocaleKeys.titles_total_points.tr(args: ["56"]),
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColor.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppDimens.paddingMedium),
              child: Text(
                LocaleKeys.warning_qr_description.tr(),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColor.white,
                ),
              ),
            ),
            CustomAssetImage(path: AssetConst.qr),
          ],
        ),
      ),
    );
  }
}
