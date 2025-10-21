// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeValueModel _$AttributeValueModelFromJson(Map<String, dynamic> json) =>
    AttributeValueModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] == null
          ? const NamesModel()
          : NamesModel.fromJson(json['title'] as Map<String, dynamic>),
    );
