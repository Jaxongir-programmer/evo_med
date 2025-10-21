import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/common/domain/entity/service_entity.dart';
import 'package:evo_med/features/on_boarding/data/models/names_model.dart';

part 'service_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class ServiceModel {
  final int id;
  final NamesModel title;
  final String image;
  final NamesModel description;
  final int price;
  final bool isMain;

  const ServiceModel({
    this.id = 0,
    this.title = const NamesModel(),
    this.image = '',
    this.description = const NamesModel(),
    this.price = 0,
    this.isMain = false,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  ServiceEntity toEntity() {
    return ServiceEntity(
      id: id,
      title: title.toEntity(),
      image: image,
      description: description.toEntity(),
      price: price,
      isMain: isMain,
    );
  }
}
