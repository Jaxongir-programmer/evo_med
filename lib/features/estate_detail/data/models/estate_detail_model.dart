import 'package:json_annotation/json_annotation.dart'; 
import 'package:evo_med/features/estate_detail/domain/entities/estate_detail_entity.dart';

part 'estate_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EstateDetailModel {

  final int id;
  final String name;

  EstateDetailModel({
    this.id = 0,
    this.name = "",
  });

  factory EstateDetailModel.fromJson(Map<String, dynamic> json) =>
      _$EstateDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$EstateDetailModelToJson(this);
  
  EstateDetailEntity toEntity() {
    return EstateDetailEntity(
      id: id,
      name: name,
    );
  }

  factory EstateDetailModel.fromEntity(EstateDetailEntity entity) {
    return EstateDetailModel(
      id: entity.id,
      name: entity.name,
    );
  }
}

    