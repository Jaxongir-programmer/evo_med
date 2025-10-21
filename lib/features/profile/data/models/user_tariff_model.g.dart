// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tariff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTariffModel _$UserTariffModelFromJson(Map<String, dynamic> json) =>
    UserTariffModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      tariff: json['tariff'] == null
          ? const TariffModel()
          : TariffModel.fromJson(json['tariff'] as Map<String, dynamic>),
      used: (json['used'] as num?)?.toInt() ?? 0,
      dailyUsed: (json['daily_used'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      startedAt: json['started_at'] as String? ?? '',
      expiresAt: json['expires_at'] as String? ?? '',
    );
