import 'package:flutter/material.dart';

class CollapsingAppBarTitle extends StatelessWidget {
  const CollapsingAppBarTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final settings = context
        .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    if (settings == null) {
      return const SizedBox.shrink();
    }

    final minExtent = settings.minExtent;
    final currentExtent = settings.currentExtent;

    final isCollapsed = currentExtent <= minExtent + 10;

    return AnimatedOpacity(
      opacity: isCollapsed ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: Text(title, style: Theme.of(context).appBarTheme.titleTextStyle),
    );
  }
}
