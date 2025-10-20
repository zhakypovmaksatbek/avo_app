import 'package:flutter/material.dart';

class NavigationTile extends StatelessWidget {
  const NavigationTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.onTap,
    this.visualDensity = VisualDensity.compact,
    this.textColor,
    this.isButton = false,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final VisualDensity? visualDensity;
  final Color? textColor;
  final bool isButton;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      onTap: onTap,
      visualDensity: visualDensity,
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Icon(icon, color: textColor),
      title: Text(
        title,
        style: textTheme.titleMedium?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: subtitle != null
          ? Text(subtitle!, style: textTheme.bodySmall)
          : null,
      trailing: isButton
          ? const Icon(Icons.navigate_next_rounded, size: 28)
          : null,
    );
  }
}
