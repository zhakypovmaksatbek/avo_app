// lib/domain/entities/restaurant.dart

class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final String logoUrl;
  final List<String> imageUrls;
  final String cashbackText; // "50 баллов | + 5% Кэшбек"
  final String workingHours; // "10:00-22:45"
  final String? whatsapp;
  final String? instagram;
  final Location location;
  final List<Promotion> promotions;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.imageUrls,
    required this.cashbackText,
    required this.workingHours,
    this.whatsapp,
    this.instagram,
    required this.location,
    this.promotions = const [],
  });
}

class Location {
  final double latitude;
  final double longitude;
  final String address;

  const Location({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}

class Promotion {
  final String id;
  final String title;
  final String subtitle;
  final int collectedCount;
  final int totalCount;
  final String iconPath;

  const Promotion({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.collectedCount,
    required this.totalCount,
    required this.iconPath,
  });
}
