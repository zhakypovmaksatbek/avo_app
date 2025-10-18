import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/presentation/widgets/image/cashed_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      padding: EdgeInsets.all(AppDimens.paddingMedium - 2),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
      ),
      child: Column(
        spacing: AppDimens.paddingSmall,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              CashedImages(
                height: 154,
                width: double.infinity,
                imageRadius: AppDimens.radiusLarge,
                imageUrl: "https://picsum.photos/200/300?random=$index",
              ),
              LikeButton(),
            ],
          ),
          RichText(
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(text: "690 с", style: textTheme.titleMedium),
                TextSpan(
                  text: "  • 100 г",
                  style: textTheme.bodyMedium?.copyWith(
                    color: theme.disabledColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Бенедикт с семгой и авокадо",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium,
          ),
          SizedBox(
            height: 32,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColor.fillColor,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppDimens.radiusMedium - 2,
                  ),
                ),
              ),
              child: Icon(
                CupertinoIcons.plus,
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        backgroundColor: AppColor.fillColor,
        padding: EdgeInsets.zero,
      ),
      visualDensity: VisualDensity.compact,
      onPressed: () {},
      icon: Icon(CupertinoIcons.heart_fill, color: AppColor.red),
    );
  }
}
