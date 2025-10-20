import 'package:auto_route/auto_route.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/presentation/widgets/image/cashed_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage(name: 'BusinessDetailRoute')
class BusinessDetailPage extends StatefulWidget {
  const BusinessDetailPage({super.key});

  @override
  State<BusinessDetailPage> createState() => _BusinessDetailPageState();
}

class _BusinessDetailPageState extends State<BusinessDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            foregroundColor: AppColor.secondary,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            expandedHeight: 300,
            useDefaultSemanticsOrder: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Business Detail'),
              stretchModes: [StretchMode.zoomBackground],
              collapseMode: CollapseMode.pin,
              background: CashedImages(
                imageUrl: "https://picsum.photos/700/800?random=1",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CashedImages(
              imageUrl: "https://picsum.photos/700/800?random=1",
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Container(height: 100, color: Colors.red);
            },
          ),
        ],
      ),
    );
  }
}
