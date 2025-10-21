import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/on_boarding/data/models/names_model.dart';
import 'package:evo_med/features/on_boarding/domain/entities/on_boarding_entity.dart';

part 'on_boarding_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OnBoardingModel {
  final int id;
  final NamesModel title;
  final String image;
  final NamesModel description;
  final int order;
  final bool isActive;

  const OnBoardingModel({
    this.id = 0,
    this.title = const NamesModel(),
    this.image = "",
    this.description = const NamesModel(),
    this.order = 0,
    this.isActive = false,
  });

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) => _$OnBoardingModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnBoardingModelToJson(this);

  OnBoardingEntity toEntity() {
    return OnBoardingEntity(
      id: id,
      title: title.toEntity(),
      image: image,
      description: description.toEntity(),
      order: order,
      isActive: isActive,
    );
  }
}
