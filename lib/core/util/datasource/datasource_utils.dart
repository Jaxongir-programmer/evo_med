import 'package:evo_med/core/error/error_handler.dart';
import 'package:dio/dio.dart';
import 'package:evo_med/features/common/domain/entity/json_error.dart';

typedef CheckResponse<T> = Future<T> Function();

/// DataSourceUtil mixin for handling response from the server

mixin DataSourceUtil {
  checkResponse<T>(CheckResponse checkResponseFunction) {
    try {
      return checkResponseFunction();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  ServerException extractMessage(Response response) {
    final List<dynamic> errors = response.data["error"];
    final error = errors.map((e) => JsonError.fromJson(e)).toList();
    throw ServerException(
      statusCode: response.statusCode ?? 500,
      errorMessage: error,
    );
  }
}
