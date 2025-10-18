import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/presentation/widgets/image/cashed_image.dart';
import 'package:flutter/material.dart';

class ActiveOrdersView extends StatelessWidget {
  const ActiveOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
      ),
      // padding: EdgeInsets.symmetric(vertical: AppDimens.paddingLarge),
      child: ListView.builder(
        itemCount: 14,
        padding: EdgeInsets.symmetric(
          vertical: AppDimens.paddingLarge,
          horizontal: AppDimens.paddingHorizontal,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const OrderCard();
        },
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 78,
      margin: EdgeInsets.only(bottom: AppDimens.paddingSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
        border: Border.all(color: AppColor.fillColor),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.paddingSmall + 2,
        vertical: AppDimens.paddingMedium,
      ),
      child: Row(
        spacing: AppDimens.paddingSmall,
        children: [
          ClipOval(
            child: CashedImages(
              imageUrl: 'https://picsum.photos/700/800?random=1',
              width: 32,
              height: 32,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '12 мая, 14:06',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 13,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Кофейня “Capito”',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2 товара',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 13,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 48,
                  height: 32,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Positioned(
                        left: 0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.white, width: 2),
                          ),
                          child: ClipOval(
                            child: CashedImages(
                              imageUrl:
                                  'https://picsum.photos/700/800?random=1',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.white, width: 2),
                          ),
                          child: ClipOval(
                            child: CashedImages(
                              imageUrl:
                                  'https://picsum.photos/700/800?random=2',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              ),
              padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingTiny),
              child: Center(
                widthFactor: 1,
                child: Text(
                  'В процессе',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColor.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
