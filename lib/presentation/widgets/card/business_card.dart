import 'package:avo/main.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/presentation/widgets/card/product_card.dart';
import 'package:avo/presentation/widgets/image/cashed_image.dart';
import 'package:avo/router/app_router.dart';
import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        router.push(const BusinessDetailRoute());
      },
      child: Container(
        width: 341,
        height: 343,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CashedImages(
                  imageUrl: "https://picsum.photos/600/1800?random=$index",
                  width: double.infinity,
                  height: 190,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppDimens.radiusLarge),
                  ),
                ),
                LikeButton(),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildChip('10:00-22:45', Icons.timer, context),
                      _buildChip('Бишкек', Icons.location_on, context),
                      _buildChip('Магазин', Icons.home, context),
                    ],
                  ),
                  Text(
                    'Магазин косметики “Inglot”',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Магазин косметики и парфюмерии',
                    style: theme.textTheme.bodySmall?.copyWith(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(
                        AppDimens.radiusLarge,
                      ),
                    ),
                    child: Text(
                      '50 баллов | + 8% Кэшбек',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColor.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, IconData icon, BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      backgroundColor: theme.scaffoldBackgroundColor,
      avatar: Icon(icon, color: theme.iconTheme.color),
      label: Padding(
        padding: EdgeInsets.only(right: 8),
        child: Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
      ),
    );
  }
}
