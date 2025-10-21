import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/features/common/domain/entity/attribute_entity.dart';
import 'package:evo_med/features/on_boarding/data/models/names_model.dart';

part 'attribute_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class AttributeModel {
  final int id;
  final AttributeDataModel attribute;
  final String deal_type;
  final int position;
  final String type;
  final bool is_active;

  const AttributeModel({
    this.id = 0,
    this.attribute = const AttributeDataModel(),
    this.deal_type = '',
    this.position = 0,
    this.type = '',
    this.is_active = false,
  });

  factory AttributeModel.fromJson(Map<String, dynamic> json) => _$AttributeModelFromJson(json);

  AttributeEntity toEntity() {
    return AttributeEntity(
      id: id,
      attribute: attribute.toEntity(),
      isActive: is_active,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class AttributeDataModel {
  final int id;
  final NamesModel title;
  final String key;
  final FilterValueType type;
  final bool has_other;
  final bool has_comment;
  final bool is_multiple_select;

  const AttributeDataModel({
    this.id = 0,
    this.title = const NamesModel(),
    this.key = '',
    this.type = FilterValueType.NUMBER,
    this.has_other = false,
    this.has_comment = false,
    this.is_multiple_select = false,
  });

  factory AttributeDataModel.fromJson(Map<String, dynamic> json) => _$AttributeDataModelFromJson(json);

  AttributeDataEntity toEntity() {
    return AttributeDataEntity(
      id: id,
      title: title.toEntity(),
      key: key,
      type: type,
      hasOther: has_other,
      hasComment: has_comment,
      isMultipleSelect: is_multiple_select,
    );
  }
}
