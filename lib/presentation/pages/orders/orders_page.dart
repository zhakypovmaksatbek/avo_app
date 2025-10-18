import 'package:auto_route/auto_route.dart';
import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/pages/orders/views/active_orders_view.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "OrdersRoute")
class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.routes_orders.tr())),
      body: Column(
        children: [
          Container(
            height: 32,
            decoration: BoxDecoration(
              color: AppColor.fillColor,
              borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
            ),
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingHorizontal,
              vertical: AppDimens.paddingSmall,
            ),

            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              dividerColor: Colors.transparent,
              labelStyle: theme.textTheme.bodyMedium?.copyWith(
                color: AppColor.secondary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: theme.disabledColor,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimens.radiusMedium - 2),
              ),
              tabs: [
                Tab(text: LocaleKeys.titles_orders_active.tr()),
                Tab(text: LocaleKeys.titles_orders_history.tr()),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ActiveOrdersView(),
                Text(LocaleKeys.routes_orders.tr()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
