import 'package:equatable/equatable.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/features/common/domain/entity/attribute_value_entity.dart';
import 'package:evo_med/features/on_boarding/domain/entities/names_entity.dart';

class AttributeEntity extends Equatable {
  final int id;
  final AttributeDataEntity attribute;
  final String dealType;
  final int position;
  final String type;
  final bool isActive;

  const AttributeEntity({
    this.id = 0,
    this.attribute = const AttributeDataEntity(),
    this.dealType = '',
    this.position = 0,
    this.type = '',
    this.isActive = false,
  });

  @override
  List<Object?> get props => [
        id,
        attribute,
        dealType,
        position,
        type,
        isActive,
      ];
}

class AttributeDataEntity extends Equatable {
  final int id;
  final NamesEntity title;
  final String key;
  final FilterValueType type;
  final bool hasOther;
  final bool hasComment;
  final bool isMultipleSelect;
  final List<AttributeValueEntity> attributeValues;

  const AttributeDataEntity({
    this.id = 0,
    this.title = const NamesEntity(),
    this.key = '',
    this.type = FilterValueType.NUMBER,
    this.hasOther = false,
    this.hasComment = false,
    this.isMultipleSelect = false,
    this.attributeValues = const [],
  });

  @override
  List<Object?> get props => [
        id,
        title,
        key,
        type,
        hasOther,
        hasComment,
        isMultipleSelect,
        attributeValues,
      ];
}
