import 'package:avo/presentation/const/app_dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.balance,
    required this.onQRPressed,
  });

  final String balance;
  final VoidCallback onQRPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.paddingExtra,
        vertical: AppDimens.paddingExtra + 7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                balance,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Balance",
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(
              CupertinoIcons.qrcode_viewfinder,
              color: theme.colorScheme.onPrimary,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
