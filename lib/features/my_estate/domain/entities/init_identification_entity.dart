import 'package:equatable/equatable.dart';

class InitIdentificationEntity extends Equatable {
  final String requestId;
  final int ttl;
  final String ip;
  final String client;

  const InitIdentificationEntity({
    this.requestId = '',
    this.ttl = 0,
    this.ip = '',
    this.client = '',
  });

  @override
  List<Object?> get props => [
        requestId,
        ttl,
        ip,
        client,
      ];
}
