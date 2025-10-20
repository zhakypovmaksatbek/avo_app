import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/widgets/image/cashed_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.username,
    required this.phoneNumber,
    required this.avatarUrl,
    required this.onEditPressed,
  });

  final String username;
  final String phoneNumber;
  final String avatarUrl;
  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SliverAppBar(
      title: Row(
        spacing: AppDimens.paddingSmall,
        children: [
          ClipOval(
            child: CashedImages(width: 40, height: 40, imageUrl: avatarUrl),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username, style: textTheme.titleMedium),
              Text(phoneNumber, style: textTheme.bodySmall),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: AppDimens.paddingHorizontal),
          child: IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
            onPressed: onEditPressed,
            icon: Icon(
              CupertinoIcons.pencil,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
