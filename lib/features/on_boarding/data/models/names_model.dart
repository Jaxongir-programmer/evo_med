import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/on_boarding/domain/entities/names_entity.dart';

part 'names_model.g.dart';

@JsonSerializable()
class NamesModel {
  final String uz;
  final String ru;
  final String uzc;

  const NamesModel({
    this.uz = '',
    this.ru = '',
    this.uzc = '',
  });

  factory NamesModel.fromJson(Map<String, dynamic> json) => _$NamesModelFromJson(json);

  Map<String, dynamic> toJson() => _$NamesModelToJson(this);

  NamesEntity toEntity() {
    return NamesEntity(
      uz: uz,
      ru: ru,
      uzc: uzc,
    );
  }

  factory NamesModel.fromEntity(NamesEntity entity) {
    return NamesModel(
      uz: entity.uz,
      ru: entity.ru,
      uzc: entity.uzc,
    );
  }
}
