import 'package:auto_route/auto_route.dart';
import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/pages/detail/widgets/collapsing_app_bar_title.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/presentation/widgets/image/cashed_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_tools/sliver_tools.dart';

@RoutePage(name: 'BusinessDetailRoute')
class BusinessDetailPage extends StatefulWidget {
  const BusinessDetailPage({super.key});

  @override
  State<BusinessDetailPage> createState() => _BusinessDetailPageState();
}

class _BusinessDetailPageState extends State<BusinessDetailPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            foregroundColor: AppColor.secondary,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            expandedHeight: 532,
            useDefaultSemanticsOrder: false,
            title: const CollapsingAppBarTitle(title: 'Кофейня “Capito”'),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.zoomBackground],
              collapseMode: CollapseMode.pin,

              background: Stack(
                children: [
                  Column(
                    children: [
                      CashedImages(
                        height: 340,
                        width: double.infinity,
                        imageUrl: "https://picsum.photos/700/800?random=1",
                      ),
                      SizedBox(height: 45),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimens.paddingHorizontal,
                        ),
                        child: Column(
                          spacing: AppDimens.paddingTiny,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Кофейня “Capito”',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Cемейный современный ресторан событийного формата традиционной европейской кухни.",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.textTheme.bodySmall?.color,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: AppDimens.paddingTiny,
                              children: [
                                Chip(
                                  side: BorderSide.none,
                                  avatar: Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: theme.colorScheme.secondary,
                                  ),
                                  label: Text("10:00-22:45"),
                                ),
                                Chip(
                                  side: BorderSide.none,
                                  avatar: Icon(
                                    Icons.chat_rounded,
                                    size: 16,
                                    color: theme.colorScheme.secondary,
                                  ),
                                  label: Text("WhatsApp"),
                                ),
                                Chip(
                                  side: BorderSide.none,
                                  avatar: Icon(
                                    Icons.telegram,
                                    size: 16,
                                    color: theme.colorScheme.secondary,
                                  ),
                                  label: Text("Telegram"),
                                ),
                              ],
                            ),
                            SizedBox(height: AppDimens.paddingExtra),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  LocaleKeys.buttons_view_in_map.tr(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 218,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 70,
                      width: 70,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Colors.white),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://picsum.photos/700/800?random=1",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.paddingHorizontal,
            ),
            sliver: DecoratedSliver(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              sliver: MultiSliver(
                children: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.paddingHorizontal,
                        vertical: AppDimens.paddingMedium,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        spacing: AppDimens.paddingTiny,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              dividerColor: Colors.transparent,
                              indicatorColor: Colors.transparent,
                              padding: EdgeInsets.zero,

                              indicatorWeight: 0.1,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding: EdgeInsets.zero,
                              indicator: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelPadding: EdgeInsets.zero,
                              labelStyle: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              unselectedLabelStyle: theme.textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: theme.textTheme.bodySmall?.color,
                                  ),
                              tabs: [
                                Tab(text: "Меню"),
                                Tab(text: "Инфо"),
                              ],
                              controller: _tabController,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimens.paddingHorizontal,
                    ),
                    sliver: SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisExtent: 292,
                        mainAxisSpacing: AppDimens.paddingMedium,
                        crossAxisSpacing: AppDimens.paddingMedium,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(AppDimens.paddingSmall + 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppDimens.paddingLarge,
                            ),
                            border: Border.all(
                              color: AppColor.fillColor,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            spacing: AppDimens.paddingSmall,
                            children: [
                              Stack(
                                children: [
                                  CashedImages(
                                    width: double.infinity,
                                    height: 154,
                                    imageRadius: AppDimens.paddingMedium,
                                    imageUrl:
                                        "https://picsum.photos/700/800?random=1",
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton.filled(
                                      style: IconButton.styleFrom(
                                        backgroundColor:
                                            theme.colorScheme.surface,
                                        foregroundColor: theme.iconTheme.color,
                                      ),
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: AppDimens.paddingSmall,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "690 с",
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          color:
                                              theme.textTheme.bodySmall?.color,
                                        ),
                                  ),
                                  Text(
                                    " 230г",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.textTheme.bodySmall?.color,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Бенедикт с семгой и авокадо",
                                style: theme.textTheme.bodyMedium?.copyWith(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        theme.scaffoldBackgroundColor,
                                    foregroundColor:
                                        theme.textTheme.bodyMedium?.color,
                                  ),
                                  child: Icon(CupertinoIcons.plus),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
