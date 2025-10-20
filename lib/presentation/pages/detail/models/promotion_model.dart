// lib/domain/entities/restaurant.dart

import 'package:flutter/material.dart';

class Promotion {
  final String id;
  final String title;
  final String subtitle;
  final int collectedCount; // Kullanıcının topladığı sayı
  final int totalCount; // Toplam gerekli sayı
  final PromotionType type; // Promosyon tipi
  final String? iconUrl; // İkon URL (opsiyonel)
  final IconData? iconData; // Flutter icon (opsiyonel)
  final Color? color; // Tema rengi
  final DateTime? expiryDate; // Son kullanma tarihi
  final bool isActive; // Aktif mi?
  final String? rewardDescription; // Ödül açıklaması

  const Promotion({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.collectedCount,
    required this.totalCount,
    this.type = PromotionType.loyalty,
    this.iconUrl,
    this.iconData,
    this.color,
    this.expiryDate,
    this.isActive = true,
    this.rewardDescription,
  });

  // Progress yüzdesi
  double get progress => collectedCount / totalCount;

  // Tamamlandı mı?
  bool get isCompleted => collectedCount >= totalCount;

  // Kalan sayı
  int get remaining => totalCount - collectedCount;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'collected_count': collectedCount,
      'total_count': totalCount,
      'type': type.name,
      'icon_url': iconUrl,
      'color': color?.value,
      'expiry_date': expiryDate?.toIso8601String(),
      'is_active': isActive,
      'reward_description': rewardDescription,
    };
  }

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      collectedCount: json['collected_count'] ?? 0,
      totalCount: json['total_count'] ?? 0,
      type: PromotionType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => PromotionType.loyalty,
      ),
      iconUrl: json['icon_url'],
      color: json['color'] != null ? Color(json['color']) : null,
      expiryDate: json['expiry_date'] != null
          ? DateTime.parse(json['expiry_date'])
          : null,
      isActive: json['is_active'] ?? true,
      rewardDescription: json['reward_description'],
    );
  }

  Promotion copyWith({
    String? id,
    String? title,
    String? subtitle,
    int? collectedCount,
    int? totalCount,
    PromotionType? type,
    String? iconUrl,
    IconData? iconData,
    Color? color,
    DateTime? expiryDate,
    bool? isActive,
    String? rewardDescription,
  }) {
    return Promotion(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      collectedCount: collectedCount ?? this.collectedCount,
      totalCount: totalCount ?? this.totalCount,
      type: type ?? this.type,
      iconUrl: iconUrl ?? this.iconUrl,
      iconData: iconData ?? this.iconData,
      color: color ?? this.color,
      expiryDate: expiryDate ?? this.expiryDate,
      isActive: isActive ?? this.isActive,
      rewardDescription: rewardDescription ?? this.rewardDescription,
    );
  }
}

enum PromotionType {
  loyalty, // Sadakat programı (7 kahve = 1 bedava)
  cashback, // Para iadesi
  discount, // İndirim
  gift, // Hediye
  special, // Özel kampanya
}
