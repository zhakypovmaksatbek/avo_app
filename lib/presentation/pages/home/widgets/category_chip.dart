import 'package:avo/presentation/const/app_dimens.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingHorizontal),
      child: Row(
        spacing: 8,
        children: List.generate(
          10,
          (index) => Chip(
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
            ),
            padding: EdgeInsets.zero,
            labelPadding: const EdgeInsets.only(top: 4, bottom: 6, right: 8),

            visualDensity: VisualDensity.compact,
            avatar: Icon(Icons.category, color: theme.iconTheme.color),
            label: Text(
              'Category $index',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
