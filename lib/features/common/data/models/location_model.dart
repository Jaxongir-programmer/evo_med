import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/common/domain/entity/location_entity.dart';
import 'package:evo_med/features/on_boarding/data/models/names_model.dart';

part 'location_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LocationModel {
  final int id;
  final NamesModel title;
  final String code;
  final bool isActive;

  const LocationModel({
    this.id = 0,
    this.title = const NamesModel(),
    this.code = '',
    this.isActive = false,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  LocationEntity toEntity() {
    return LocationEntity(
      id: id,
      title: title.toEntity(),
      code: code,
      isActive: isActive,
    );
  }
}
