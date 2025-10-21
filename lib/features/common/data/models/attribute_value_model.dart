import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/common/domain/entity/attribute_value_entity.dart';
import 'package:evo_med/features/on_boarding/data/models/names_model.dart';

part 'attribute_value_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class AttributeValueModel {
  final int id;
  final NamesModel title;

  const AttributeValueModel({
    this.id = 0,
    this.title = const NamesModel(),
  });

  factory AttributeValueModel.fromJson(Map<String, dynamic> json) => _$AttributeValueModelFromJson(json);

  AttributeValueEntity toEntity() {
    return AttributeValueEntity(
      id: id,
      title: title.toEntity(),
    );
  }
}
