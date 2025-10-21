import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/my_estate/domain/entities/init_identification_entity.dart';

part 'init_identification_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class InitIdentificationModel {
  final String requestId;
  final int ttl;
  final String ip;
  final String client;

  const InitIdentificationModel({
    this.requestId = '',
    this.ttl = 0,
    this.ip = '',
    this.client = '',
  });

  factory InitIdentificationModel.fromJson(Map<String, dynamic> json) =>
      _$InitIdentificationModelFromJson(json);

  InitIdentificationEntity toEntity() {
    return InitIdentificationEntity(
      requestId: requestId,
      ttl: ttl,
      ip: ip,
      client: client,
    );
  }

}