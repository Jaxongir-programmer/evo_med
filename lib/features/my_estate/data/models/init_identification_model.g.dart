// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_identification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitIdentificationModel _$InitIdentificationModelFromJson(
        Map<String, dynamic> json) =>
    InitIdentificationModel(
      requestId: json['request_id'] as String? ?? '',
      ttl: (json['ttl'] as num?)?.toInt() ?? 0,
      ip: json['ip'] as String? ?? '',
      client: json['client'] as String? ?? '',
    );
