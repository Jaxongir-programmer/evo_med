// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) =>
    ServicesModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$ServicesModelToJson(ServicesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
