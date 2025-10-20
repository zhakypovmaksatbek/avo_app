// lib/presentation/pages/restaurant/widgets/restaurant_info_section.dart

import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/pages/detail/models/restaurant_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantInfoSection extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantInfoSection({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.all(AppDimens.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo & Restaurant Name
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: restaurant.logoUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.restaurant),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 16),

              // Restaurant Name & Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      restaurant.description,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Working Hours & Social Links
          Row(
            children: [
              // Working Hours
              Icon(Icons.access_time, size: 20, color: Colors.grey[700]),
              SizedBox(width: 8),
              Text(
                restaurant.workingHours,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(width: 24),

              // WhatsApp
              if (restaurant.whatsapp != null) ...[
                InkWell(
                  onTap: () => _launchWhatsApp(restaurant.whatsapp!),
                  child: Row(
                    children: [
                      Icon(Icons.phone, size: 20, color: Color(0xFF25D366)),
                      SizedBox(width: 4),
                      Text(
                        "What'sApp",
                        style: textTheme.bodyMedium?.copyWith(
                          color: Color(0xFF25D366),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              Spacer(),

              // Instagram
              if (restaurant.instagram != null)
                InkWell(
                  onTap: () => _launchInstagram(restaurant.instagram!),
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Color(0xFFE4405F),
                      ),
                      SizedBox(width: 4),
                      Text(
                        restaurant.instagram!,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Color(0xFFE4405F),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          SizedBox(height: 20),

          // Map Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                // Open map
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00897B),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Text(
                'Посмотреть в карте',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchWhatsApp(String phone) async {
    final url = 'https://wa.me/$phone';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _launchInstagram(String username) async {
    final url = 'https://instagram.com/$username';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
