import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/auth/domain/entities/token_entity.dart';

part 'token_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TokenModel {
  final String token;
  final String refreshToken;

  TokenModel({
    this.token = "",
    this.refreshToken = "",
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  TokenEntity toEntity() {
    return TokenEntity(
      token: token,
      refreshToken: refreshToken,
    );
  }

  factory TokenModel.fromEntity(TokenEntity entity) {
    return TokenModel(
      token: entity.token,
      refreshToken: entity.refreshToken,
    );
  }
}
