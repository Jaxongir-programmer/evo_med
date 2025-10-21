import 'package:equatable/equatable.dart';
import 'package:evo_med/features/common/domain/entity/json_error.dart';

abstract class Failure extends Equatable {
  final List<JsonError> errorMessage;

  const Failure({required this.errorMessage});

  String getErrorMessage() {
    if (errorMessage.isNotEmpty) {
      return errorMessage[0].error;
    } else {
      return "Unknown Error";
    }
  }

  @override
  List<Object> get props => [errorMessage];
}

class ServerFailure extends Failure {
  final num statusCode;

  const ServerFailure({required super.errorMessage, required this.statusCode});
}

class DioFailure extends Failure {
  const DioFailure({required super.errorMessage});
}

class ParsingFailure extends Failure {
  const ParsingFailure({required super.errorMessage});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.errorMessage});
}
