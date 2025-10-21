// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] == null
          ? const NamesModel()
          : NamesModel.fromJson(json['title'] as Map<String, dynamic>),
      image: json['image'] as String? ?? '',
      description: json['description'] == null
          ? const NamesModel()
          : NamesModel.fromJson(json['description'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt() ?? 0,
      isMain: json['is_main'] as bool? ?? false,
    );
