// import 'package:auto_route/auto_route.dart';
// import 'package:avo/presentation/pages/detail/models/restaurant_model.dart';
// import 'package:avo/presentation/pages/detail/widgets/restaurant_appbar.dart';
// import 'package:avo/presentation/pages/detail/widgets/restaurant_body.dart';
// import 'package:flutter/material.dart';

// @RoutePage(name: 'BusinessDetailRoute')
// class BusinessDetailPage extends StatefulWidget {
//   const BusinessDetailPage({super.key});

//   @override
//   State<BusinessDetailPage> createState() => _BusinessDetailPageState();
// }

// class _BusinessDetailPageState extends State<BusinessDetailPage>
//     with TickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<Color?> bgColor, textColor, iconColor;
//   bool isFavorite = false;

//   @override
//   void initState() {
//     super.initState();

//     animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 400),
//     );

//     bgColor = ColorTween(
//       begin: Colors.transparent,
//       end: Colors.white,
//     ).animate(animationController);

//     textColor = ColorTween(
//       begin: Colors.white,
//       end: Colors.black,
//     ).animate(animationController);

//     iconColor = ColorTween(
//       begin: Colors.white,
//       end: Colors.black,
//     ).animate(animationController);
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: NotificationListener<ScrollNotification>(
//         onNotification: _scrollNotification,
//         child: Stack(
//           children: [
//             // Body Content
//             RestaurantBody(
//               restaurant: RestaurantModel(
//                 id: '1',
//                 name: 'Business Name',
//                 description: 'Business Description',
//                 location: Location(latitude: 0.0, longitude: 0.0, address: ''),
//                 promotions: [
//                   Promotion(
//                     id: '1',
//                     title: 'Promotion Title',
//                     subtitle: 'Promotion Subtitle',
//                     collectedCount: 0,
//                     totalCount: 0,
//                     iconPath: 'https://picsum.photos/700/800?random=1',
//                   ),
//                 ],
//                 logoUrl: 'https://picsum.photos/700/800?random=23',
//                 imageUrls: [
//                   'https://picsum.photos/700/800?random=1',
//                   'https://picsum.photos/700/800?random=2',
//                   'https://picsum.photos/700/800?random=3',
//                 ],
//                 cashbackText: '10%',
//                 workingHours: '9:00 - 18:00',
//               ),
//             ),

//             // Animated AppBar
//             RestaurantAppBar(
//               animationController: animationController,
//               bgColor: bgColor,
//               textColor: textColor,
//               iconColor: iconColor,
//               restaurantName: 'Business Name',
//               isFavorite: isFavorite,
//               onBackTap: () => context.router.back(),
//               onFavoriteTap: () {
//                 setState(() {
//                   isFavorite = !isFavorite;
//                 });
//               },
//               onShareTap: () {
//                 // Share functionality
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   bool _scrollNotification(ScrollNotification notification) {
//     if (notification.metrics.axis == Axis.vertical) {
//       // AppBar animasyonu: 0-200 pixel arası
//       final progress = (notification.metrics.pixels / 200).clamp(0.0, 1.0);
//       animationController.value = progress;
//       return true;
//     }
//     return false;
//   }
// }
