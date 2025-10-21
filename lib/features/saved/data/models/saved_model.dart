import 'package:json_annotation/json_annotation.dart'; 
import 'package:evo_med/features/saved/domain/entities/saved_entity.dart';

part 'saved_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SavedModel {

  final int id;
  final String name;

  SavedModel({
    this.id = 0,
    this.name = "",
  });

  factory SavedModel.fromJson(Map<String, dynamic> json) =>
      _$SavedModelFromJson(json);

  Map<String, dynamic> toJson() => _$SavedModelToJson(this);
  
  SavedEntity toEntity() {
    return SavedEntity(
      id: id,
      name: name,
    );
  }

  factory SavedModel.fromEntity(SavedEntity entity) {
    return SavedModel(
      id: entity.id,
      name: entity.name,
    );
  }
}

    