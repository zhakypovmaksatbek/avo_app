// lib/presentation/pages/restaurant/widgets/restaurant_appbar.dart

import 'package:flutter/material.dart';

class RestaurantAppBar extends StatelessWidget {
  final AnimationController animationController;
  final Animation<Color?> bgColor;
  final Animation<Color?> textColor;
  final Animation<Color?> iconColor;
  final String restaurantName;
  final bool isFavorite;
  final VoidCallback onBackTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onShareTap;

  const RestaurantAppBar({
    super.key,
    required this.animationController,
    required this.bgColor,
    required this.textColor,
    required this.iconColor,
    required this.restaurantName,
    required this.isFavorite,
    required this.onBackTap,
    required this.onFavoriteTap,
    required this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return AppBar(
            backgroundColor: bgColor.value,
            elevation: animationController.value > 0.5 ? 1 : 0,
            automaticallyImplyLeading: false,
            title: Opacity(
              opacity: animationController.value,
              child: Text(
                restaurantName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor.value,
                ),
              ),
            ),
            centerTitle: true,
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: onBackTap,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: animationController.value < 0.5
                        ? Colors.white.withValues(alpha: 0.9)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                    boxShadow: animationController.value < 0.5
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ]
                        : [],
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: animationController.value < 0.5
                        ? Colors.black
                        : iconColor.value,
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: onShareTap,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: animationController.value < 0.5
                          ? Colors.white.withValues(alpha: 0.9)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      boxShadow: animationController.value < 0.5
                          ? [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    child: Icon(
                      Icons.ios_share,
                      color: animationController.value < 0.5
                          ? Colors.black
                          : iconColor.value,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
