import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  final String token;
  final String refreshToken;

  const TokenEntity({
    this.token = '',
    this.refreshToken = '',
  });

  @override
  List<Object?> get props => [
        token,
        refreshToken,
      ];
}
