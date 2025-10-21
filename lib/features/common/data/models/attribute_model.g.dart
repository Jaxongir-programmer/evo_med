// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeModel _$AttributeModelFromJson(Map<String, dynamic> json) =>
    AttributeModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      attribute: json['attribute'] == null
          ? const AttributeDataModel()
          : AttributeDataModel.fromJson(
              json['attribute'] as Map<String, dynamic>),
      deal_type: json['deal_type'] as String? ?? '',
      position: (json['position'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      is_active: json['is_active'] as bool? ?? false,
    );

AttributeDataModel _$AttributeDataModelFromJson(Map<String, dynamic> json) =>
    AttributeDataModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] == null
          ? const NamesModel()
          : NamesModel.fromJson(json['title'] as Map<String, dynamic>),
      key: json['key'] as String? ?? '',
      type: $enumDecodeNullable(_$FilterValueTypeEnumMap, json['type']) ??
          FilterValueType.NUMBER,
      has_other: json['has_other'] as bool? ?? false,
      has_comment: json['has_comment'] as bool? ?? false,
      is_multiple_select: json['is_multiple_select'] as bool? ?? false,
    );

const _$FilterValueTypeEnumMap = {
  FilterValueType.NUMBER: 'number',
  FilterValueType.TEXT: 'text',
  FilterValueType.CHECKBOX: 'checkbox',
};
