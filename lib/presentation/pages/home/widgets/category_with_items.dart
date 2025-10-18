import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/widgets/card/business_card.dart';
import 'package:flutter/material.dart';

class CategoryWithItems extends StatelessWidget {
  const CategoryWithItems({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.paddingHorizontal,
          ),
          child: Text(
            categoryName,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 343,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.paddingHorizontal,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => BusinessCard(index: index),
            separatorBuilder: (context, index) => SizedBox(width: 16),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
