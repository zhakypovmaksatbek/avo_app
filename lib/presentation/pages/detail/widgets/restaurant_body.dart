// lib/presentation/pages/restaurant/widgets/restaurant_body.dart

import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/pages/detail/models/restaurant_model.dart';
import 'package:avo/presentation/pages/detail/widgets/restaurant_image_section.dart';
import 'package:avo/presentation/pages/detail/widgets/restaurant_info_section.dart';
import 'package:avo/presentation/pages/detail/widgets/restaurant_tabs_section.dart';
import 'package:flutter/material.dart';

class RestaurantBody extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantBody({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.5;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Image Carousel Section
          RestaurantImageSection(restaurant: restaurant, height: imageHeight),

          // White Container with rounded top
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Restaurant Info (Logo, Name, Description, etc.)
                RestaurantInfoSection(restaurant: restaurant),

                SizedBox(height: AppDimens.paddingMedium),

                // Tabs Section (Меню / Инфо)
                RestaurantTabsSection(restaurant: restaurant),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
