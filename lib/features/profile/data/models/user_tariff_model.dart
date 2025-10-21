import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/profile/data/models/tariff_model.dart';
import 'package:evo_med/features/profile/domain/entities/user_tariff_entity.dart';

part 'user_tariff_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class UserTariffModel {
  final int id;
  final TariffModel tariff;
  final int used;
  final int dailyUsed;
  final int limit;
  final String startedAt;
  final String expiresAt;

  const UserTariffModel({
    this.id = 0,
    this.tariff = const TariffModel(),
    this.used = 0,
    this.dailyUsed = 0,
    this.limit = 0,
    this.startedAt = '',
    this.expiresAt = '',
  });

  factory UserTariffModel.fromJson(Map<String, dynamic> json) => _$UserTariffModelFromJson(json);

  UserTariffEntity toEntity() {
    return UserTariffEntity(
      id: id,
      tariff: tariff.toEntity(),
      used: used,
      dailyUsed: dailyUsed,
      limit: limit,
      startedAt: startedAt,
      expiresAt: expiresAt,
    );
  }
}
