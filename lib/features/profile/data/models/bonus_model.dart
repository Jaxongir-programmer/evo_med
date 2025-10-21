import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/profile/domain/entities/bonus_entity.dart';

part 'bonus_model.g.dart';

@JsonSerializable(explicitToJson: false)
class BonusModel {
  final int view;
  final int post;

  const BonusModel({
    this.view = 0,
    this.post = 0,
  });

  factory BonusModel.fromJson(Map<String, dynamic> json) => _$BonusModelFromJson(json);

  BonusEntity toEntity() {
    return BonusEntity(
      view: view,
      post: post,
    );
  }
}
