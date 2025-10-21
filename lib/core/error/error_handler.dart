import 'package:evo_med/features/common/domain/entity/json_error.dart';

class ServerException implements Exception {
  final List<JsonError> errorMessage;
  final num statusCode;

  const ServerException({this.statusCode = 400, this.errorMessage = const []});

  @override
  String toString() => 'ServerException(statusCode: $statusCode, errorMessage: $errorMessage)';
}

class ParsingException implements Exception {
  final String errorMessage;

  const ParsingException({required this.errorMessage});
}

class CacheException implements Exception {
  final String errorMessage;

  const CacheException({required this.errorMessage});
}
