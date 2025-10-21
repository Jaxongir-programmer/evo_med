import 'package:json_annotation/json_annotation.dart'; 
import 'package:evo_med/features/add_announcement/domain/entities/add_announcement_entity.dart';

part 'add_announcement_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AddAnnouncementModel {

  final int id;
  final String name;

  AddAnnouncementModel({
    this.id = 0,
    this.name = "",
  });

  factory AddAnnouncementModel.fromJson(Map<String, dynamic> json) =>
      _$AddAnnouncementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddAnnouncementModelToJson(this);
  
  AddAnnouncementEntity toEntity() {
    return AddAnnouncementEntity(
      id: id,
      name: name,
    );
  }

  factory AddAnnouncementModel.fromEntity(AddAnnouncementEntity entity) {
    return AddAnnouncementModel(
      id: entity.id,
      name: entity.name,
    );
  }
}

    