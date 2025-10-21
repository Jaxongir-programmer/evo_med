import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/auth/data/data_sources/auth_datasource.dart';
import 'package:evo_med/features/auth/domain/entities/token_entity.dart';
import 'package:evo_med/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl with RepositoryUtil implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failure, void>> getVerificationCode(params) {
    return callSafely(() async {
      var result = await authDataSource.getVerificationCode(params);
      return result;
    });
  }

  @override
  Future<Either<Failure, bool>> checkVerificationCode(VerificationCodeParams params) {
    return callSafely(() async {
      var result = await authDataSource.checkVerificationCode(params);
      return result;
    });
  }

  @override
  Future<Either<Failure, void>> register(RegisterParams params) {
    return callSafely(() async {
      var result = await authDataSource.registerUser(params);
      return result;
    });
  }

  @override
  Future<Either<Failure, void>> resetPassword(ResetPasswordParams params) {
    return callSafely(() async {
      var result = await authDataSource.resetPassword(params);
      return result;
    });
  }

  @override
  Future<Either<Failure, TokenEntity>> login(LoginParams params) {
    return callSafely(() async {
      var result = await authDataSource.login(params);
      return result.toEntity();
    });
  }

  @override
  Future<Either<Failure, void>> forgetPasswordGetVerification(String params) {
    return callSafely(() async {
      var result = await authDataSource.forgotPassword(params);
      return result;
    });
  }
}
