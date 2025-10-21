// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedModel _$SavedModelFromJson(Map<String, dynamic> json) => SavedModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$SavedModelToJson(SavedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
