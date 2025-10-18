import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../const/app_dimens.dart';
import '../../../theme/app_color.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingHorizontal,
      ),
      child: Container(
        height: 48,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingLarge,
          vertical: AppDimens.paddingMedium,
        ),
        decoration: BoxDecoration(
          color: AppColor.fillColor,
          borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
        ),
        child: Row(
          spacing: 4,
          children: [
            Icon(CupertinoIcons.search, color: theme.disabledColor),
            Text(
              'Search',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.disabledColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
