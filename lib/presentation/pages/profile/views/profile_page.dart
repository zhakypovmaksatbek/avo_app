import 'package:auto_route/auto_route.dart';
import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/main.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/pages/profile/constants/profile_constants.dart';
import 'package:avo/presentation/pages/profile/widgets/widgets.dart';
import 'package:avo/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "ProfileRoute")
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _pushNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildProfileHeader(),
          _buildProfileStatsSection(),
          _buildSettingsSection(theme),
          _buildInfoSection(theme),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return ProfileHeader(
      username: ProfileConstants.defaultUsername,
      phoneNumber: ProfileConstants.defaultPhoneNumber,
      avatarUrl: ProfileConstants.defaultAvatarUrl,
      onEditPressed: _onEditProfile,
    );
  }

  Widget _buildProfileStatsSection() {
    return ProfileSection(
      title: ProfileConstants.profileSectionTitle,
      children: [
        SizedBox(
          height: ProfileConstants.profileCardHeight,
          child: Row(
            spacing: AppDimens.paddingSmall,
            children: [
              Expanded(
                flex: 3,
                child: BalanceCard(
                  balance: ProfileConstants.defaultBalance,
                  onQRPressed: _onQRPressed,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  spacing: AppDimens.paddingSmall,
                  children: [
                    QuickActionCard(
                      icon: Icons.schedule,
                      title: LocaleKeys.titles_orders_history.tr(),
                      onTap: _onOrdersHistoryPressed,
                    ),
                    QuickActionCard(
                      icon: Icons.bar_chart_rounded,
                      title: LocaleKeys.titles_levels.tr(),
                      onTap: _onLevelsPressed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection(ThemeData theme) {
    return ProfileSection(
      title: "",
      children: [
        NavigationTile(
          title: ProfileConstants.paymentMethodsTitle,
          subtitle: ProfileConstants.paymentMethodsSubtitle,
          icon: Icons.wallet,
          onTap: _onPaymentMethodsPressed,
          isButton: true,
        ),
        const Divider(height: 0),
        NavigationTile(
          title: ProfileConstants.supportTitle,
          subtitle: ProfileConstants.supportSubtitle,
          icon: Icons.chat,
          onTap: _onSupportPressed,
          isButton: true,
        ),
        const Divider(height: 0),
        _buildPushNotificationSwitch(theme),
      ],
    );
  }

  Widget _buildPushNotificationSwitch(ThemeData theme) {
    return SwitchListTile(
      value: _pushNotificationsEnabled,
      onChanged: _onPushNotificationChanged,
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      secondary: const Icon(
        Icons.notifications,
        size: ProfileConstants.notificationIconSize,
      ),
      title: Text(
        ProfileConstants.pushNotificationsTitle,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildInfoSection(ThemeData theme) {
    return ProfileSection(
      title: "",
      children: [
        NavigationTile(
          title: ProfileConstants.aboutAppTitle,
          icon: Icons.account_balance_wallet_outlined,
          onTap: _onAboutAppPressed,
          visualDensity: VisualDensity.standard,
        ),
        const Divider(height: 0),
        NavigationTile(
          title: ProfileConstants.faqTitle,
          icon: Icons.help_outline,
          onTap: _onFAQPressed,
          visualDensity: VisualDensity.standard,
        ),
        const Divider(height: 0),
        NavigationTile(
          title: ProfileConstants.logoutTitle,
          icon: Icons.turn_left_outlined,
          onTap: _onLogoutPressed,
          visualDensity: VisualDensity.standard,
          textColor: theme.colorScheme.error,
        ),
      ],
    );
  }

  // Event handlers
  void _onEditProfile() {
    router.push(const EditProfileRoute());
  }

  void _onQRPressed() {
    // TODO: Implement QR code functionality
  }

  void _onOrdersHistoryPressed() {
    // TODO: Navigate to orders history
  }

  void _onLevelsPressed() {
    // TODO: Navigate to levels page
  }

  void _onPaymentMethodsPressed() {
    // TODO: Navigate to payment methods
  }

  void _onSupportPressed() {
    // TODO: Navigate to support
  }

  void _onPushNotificationChanged(bool value) {
    setState(() {
      _pushNotificationsEnabled = value;
    });
    // TODO: Update push notification settings
  }

  void _onAboutAppPressed() {
    // TODO: Navigate to about app
  }

  void _onFAQPressed() {
    // TODO: Navigate to FAQ
  }

  void _onLogoutPressed() {
    // TODO: Implement logout functionality
  }
}
