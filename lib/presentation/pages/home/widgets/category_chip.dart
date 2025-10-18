import 'package:avo/presentation/const/app_dimens.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingHorizontal,
        ),
        child: Row(
          spacing: 8,
          children: List.generate(
            10,
            (index) => Chip(
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
              ),
              avatar: Icon(Icons.category, color: theme.iconTheme.color),
              label: Text('Category $index'),
            ),
          ),
        ),
      ),
    );
  }
}
