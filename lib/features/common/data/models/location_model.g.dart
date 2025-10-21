// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] == null
          ? const NamesModel()
          : NamesModel.fromJson(json['title'] as Map<String, dynamic>),
      code: json['code'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? false,
    );
