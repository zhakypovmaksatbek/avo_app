import 'package:auto_route/auto_route.dart';
import 'package:avo/presentation/const/asset_const.dart';
import 'package:avo/presentation/pages/home/widgets/category_chip.dart';
import 'package:avo/presentation/pages/home/widgets/category_with_items.dart';
import 'package:avo/presentation/pages/home/widgets/home_stories.dart';
import 'package:avo/presentation/pages/home/widgets/search_card.dart';
import 'package:avo/presentation/widgets/image/custom_asset_image.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "HomeRoute")
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            leadingWidth: 80,
            leading: GestureDetector(
              onTap: () {
                _scrollController.animateTo(
                  _scrollController.position.pixels,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: CustomAssetImage(path: AssetConst.pngLogo),
              ),
            ),
            elevation: 1,
          ),
          SliverToBoxAdapter(
            child: Column(
              spacing: 8,
              children: [HomeStories(), SearchCard(), CategoryChip()],
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                spacing: 24,
                children: [
                  CategoryWithItems(categoryName: 'Магазины'),
                  CategoryWithItems(categoryName: 'Рестораны'),
                  CategoryWithItems(categoryName: 'Кофейни'),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
