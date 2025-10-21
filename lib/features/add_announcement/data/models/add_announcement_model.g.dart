// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAnnouncementModel _$AddAnnouncementModelFromJson(
        Map<String, dynamic> json) =>
    AddAnnouncementModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$AddAnnouncementModelToJson(
        AddAnnouncementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
