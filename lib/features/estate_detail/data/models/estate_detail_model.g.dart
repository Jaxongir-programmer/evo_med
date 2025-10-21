// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstateDetailModel _$EstateDetailModelFromJson(Map<String, dynamic> json) =>
    EstateDetailModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$EstateDetailModelToJson(EstateDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
