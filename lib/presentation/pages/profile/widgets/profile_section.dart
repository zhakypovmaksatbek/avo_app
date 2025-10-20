import 'package:avo/presentation/const/app_dimens.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(AppDimens.paddingHorizontal),
        margin: EdgeInsets.only(top: AppDimens.paddingHorizontal),
        decoration: BoxDecoration(
          color: theme.appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title.isNotEmpty) ...[
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppDimens.paddingMedium),
            ],
            ...children,
          ],
        ),
      ),
    );
  }
}
