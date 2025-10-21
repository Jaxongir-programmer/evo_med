// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TariffModel _$TariffModelFromJson(Map<String, dynamic> json) => TariffModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toInt() ?? 0,
      sale: (json['sale'] as num?)?.toInt() ?? 0,
      billingCycle: json['billing_cycle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? false,
      expiresAt: json['expires_at'] as String? ?? '',
    );
