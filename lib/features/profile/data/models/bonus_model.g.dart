// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonusModel _$BonusModelFromJson(Map<String, dynamic> json) => BonusModel(
      view: (json['view'] as num?)?.toInt() ?? 0,
      post: (json['post'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BonusModelToJson(BonusModel instance) =>
    <String, dynamic>{
      'view': instance.view,
      'post': instance.post,
    };
