import 'package:auto_route/auto_route.dart';
import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/main.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "DashboardRoute")
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<PageRouteInfo<Object?>> routes = [
    const HomeRoute(),
    const OrdersRoute(),
    FavoritesRoute(),
    const ProfileRoute(),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
      homeIndex: 0,
      routes: routes,
      duration: Durations.long2,
      transitionBuilder: (context, child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              router.push(const QRRoute());
            },
            backgroundColor: theme.primaryColor,
            elevation: 0,
            child: const Icon(
              Icons.qr_code_scanner,
              size: 28,
              color: AppColor.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          bottomNavigationBar: BottomAppBar(
            height: 75,
            shadowColor: theme.iconTheme.color?.withValues(alpha: 0.1),
            elevation: 8,
            // color: theme.scaffoldBackgroundColor,
            shape: AutomaticNotchedShape(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimens.radiusLarge),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  context,
                  icon: CupertinoIcons.home,
                  activeIcon: CupertinoIcons.home,
                  label: LocaleKeys.routes_home.tr(),
                  index: 0,
                  currentIndex: tabsRouter.activeIndex,
                  onTap: () => tabsRouter.setActiveIndex(0),
                ),
                _buildNavItem(
                  context,
                  icon: Icons.access_time_outlined,
                  activeIcon: Icons.access_time,
                  label: LocaleKeys.routes_orders.tr(),
                  index: 1,
                  currentIndex: tabsRouter.activeIndex,
                  onTap: () => tabsRouter.setActiveIndex(1),
                ),
                const SizedBox(width: 40), // Space for FAB
                _buildNavItem(
                  context,
                  icon: Icons.favorite_outline,
                  activeIcon: Icons.favorite,
                  label: LocaleKeys.routes_favorites.tr(),
                  index: 2,
                  currentIndex: tabsRouter.activeIndex,
                  onTap: () => tabsRouter.setActiveIndex(2),
                ),
                _buildNavItem(
                  context,
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  label: LocaleKeys.routes_profile.tr(),
                  index: 3,
                  currentIndex: tabsRouter.activeIndex,
                  onTap: () => tabsRouter.setActiveIndex(3),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
    required int currentIndex,
    required VoidCallback onTap,
  }) {
    final isActive = currentIndex == index;
    final theme = Theme.of(context);
    final bottomNavigationBarTheme = theme.bottomNavigationBarTheme;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive
                  ? bottomNavigationBarTheme.selectedItemColor
                  : bottomNavigationBarTheme.unselectedItemColor,
              size: bottomNavigationBarTheme.selectedIconTheme?.size,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: isActive
                  ? bottomNavigationBarTheme.selectedLabelStyle
                  : bottomNavigationBarTheme.unselectedLabelStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
