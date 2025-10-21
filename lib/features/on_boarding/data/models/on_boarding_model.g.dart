// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_boarding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnBoardingModel _$OnBoardingModelFromJson(Map<String, dynamic> json) =>
    OnBoardingModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] == null
          ? const NamesModel()
          : NamesModel.fromJson(json['title'] as Map<String, dynamic>),
      image: json['image'] as String? ?? "",
      description: json['description'] == null
          ? const NamesModel()
          : NamesModel.fromJson(json['description'] as Map<String, dynamic>),
      order: (json['order'] as num?)?.toInt() ?? 0,
      isActive: json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$OnBoardingModelToJson(OnBoardingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'order': instance.order,
      'is_active': instance.isActive,
    };
