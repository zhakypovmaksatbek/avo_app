// lib/presentation/pages/restaurant/widgets/restaurant_tabs_section.dart

import 'package:avo/presentation/pages/detail/models/restaurant_model.dart';
import 'package:avo/presentation/pages/detail/widgets/promotion_card.dart';
import 'package:flutter/material.dart';

class RestaurantTabsSection extends StatefulWidget {
  final RestaurantModel restaurant;

  const RestaurantTabsSection({super.key, required this.restaurant});

  @override
  State<RestaurantTabsSection> createState() => _RestaurantTabsSectionState();
}

class _RestaurantTabsSectionState extends State<RestaurantTabsSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    return Column(
      children: [
        // Tab Bar
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: 'Меню'),
              Tab(text: 'Инфо'),
            ],
          ),
        ),

        SizedBox(height: 16),

        // Tab Content
        SizedBox(
          height: 600, // Adjust based on content
          child: TabBarView(
            controller: _tabController,
            children: [
              // Меню Tab
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.restaurant.promotions.length,
                itemBuilder: (context, index) {
                  return PromotionCard(
                    promotion: widget.restaurant.promotions[index],
                  );
                },
              ),

              // Инфо Tab
              Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text('Инфо содержимое')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
