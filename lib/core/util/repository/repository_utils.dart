import 'package:evo_med/core/error/error_handler.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:dio/dio.dart';
import 'package:evo_med/features/common/domain/entity/json_error.dart';

typedef CheckException<T> = Future<T> Function();

mixin RepositoryUtil {
  Future<Either<Failure, T>> callSafely<T>(CheckException function) async {
    try {
      final result = await function();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioException catch (e) {
      return Left(DioFailure(errorMessage: [JsonError(path: e.type.name, error: e.message ?? "Something error")]));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: [JsonError(path: "Path", error: e.errorMessage)]));
    }
  }
}
