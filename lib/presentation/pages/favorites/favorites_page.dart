import 'package:auto_route/auto_route.dart';
import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/const/asset_const.dart';
import 'package:avo/presentation/pages/home/widgets/category_chip.dart';
import 'package:avo/presentation/pages/home/widgets/search_card.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/presentation/widgets/card/business_card.dart';
import 'package:avo/presentation/widgets/card/product_card.dart';
import 'package:avo/presentation/widgets/image/custom_asset_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

@RoutePage(name: "FavoritesRoute")
class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});
  final ValueNotifier<FavoriteType?> _favoriteType = ValueNotifier(
    FavoriteType.company,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            pinned: true,
            title: Text(LocaleKeys.routes_favorites.tr()),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: AppDimens.paddingHorizontal,
                ),
                child: IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColor.fillColor,
                  ),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return RadioGroup<FavoriteType>(
                          groupValue: _favoriteType.value,
                          onChanged: (value) {
                            _favoriteType.value = value;
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: AppDimens.paddingHorizontal,
                              left: AppDimens.paddingHorizontal,
                              top: AppDimens.paddingMedium,
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: FavoriteType.values
                                  .map(
                                    (e) => RadioListTile(
                                      visualDensity: VisualDensity.compact,
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(e.displayName),
                                      value: e,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: CustomAssetImage(path: AssetConst.menu),
                ),
              ),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: _favoriteType,
            builder: (context, favoriteType, child) {
              if (favoriteType == FavoriteType.company) {
                return MultiSliver(
                  children: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimens.paddingLarge,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          spacing: AppDimens.paddingMedium,
                          children: [SearchCard(), CategoryChip()],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.paddingHorizontal,
                      ),
                      sliver: SliverList.separated(
                        itemBuilder: (context, index) {
                          return BusinessCard(index: index);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: AppDimens.paddingMedium);
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return MultiSliver(
                  children: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimens.paddingLarge,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          spacing: AppDimens.paddingMedium,
                          children: [SearchCard()],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.paddingHorizontal,
                      ),
                      sliver: SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisSpacing: AppDimens.paddingMedium,
                              crossAxisSpacing: AppDimens.paddingMedium,
                              mainAxisExtent: 274,
                            ),
                        itemBuilder: (context, index) {
                          return ProductCard(index: index);
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

enum FavoriteType { company, product }

extension FavoriteTypeExtension on FavoriteType {
  String get displayName {
    switch (this) {
      case FavoriteType.company:
        return LocaleKeys.titles_company.tr();
      case FavoriteType.product:
        return LocaleKeys.titles_products.tr();
    }
  }
}
