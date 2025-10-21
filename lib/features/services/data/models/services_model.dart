import 'package:json_annotation/json_annotation.dart'; 
import 'package:evo_med/features/services/domain/entities/services_entity.dart';

part 'services_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ServicesModel {

  final int id;
  final String name;

  ServicesModel({
    this.id = 0,
    this.name = "",
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesModelToJson(this);
  
  ServicesEntity toEntity() {
    return ServicesEntity(
      id: id,
      name: name,
    );
  }

  factory ServicesModel.fromEntity(ServicesEntity entity) {
    return ServicesModel(
      id: entity.id,
      name: entity.name,
    );
  }
}

    