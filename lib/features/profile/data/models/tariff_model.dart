import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/profile/domain/entities/tariff_entity.dart';

part 'tariff_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class TariffModel {
  final int id;
  final String title;
  final int limit;
  final int price;
  final int sale;
  final String billingCycle;
  final String type;
  final bool isActive;
  final String expiresAt;

  const TariffModel({
    this.id = 0,
    this.title = '',
    this.limit = 0,
    this.price = 0,
    this.sale = 0,
    this.billingCycle = '',
    this.type = '',
    this.isActive = false,
    this.expiresAt = '',
  });

  factory TariffModel.fromJson(Map<String, dynamic> json) => _$TariffModelFromJson(json);

  TariffEntity toEntity() {
    return TariffEntity(
      id: id,
      title: title,
      limit: limit,
      price: price,
      sale: sale,
      billingCycle: billingCycle,
      type: type,
      isActive: isActive,
      expiresAt: expiresAt,
    );
  }
}
