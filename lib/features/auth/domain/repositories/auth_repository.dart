import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/auth/domain/entities/token_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> getVerificationCode(String params);

  Future<Either<Failure, void>> forgetPasswordGetVerification(String params);

  Future<Either<Failure, bool>> checkVerificationCode(VerificationCodeParams params);

  Future<Either<Failure, void>> register(RegisterParams params);

  Future<Either<Failure, void>> resetPassword(ResetPasswordParams params);

  Future<Either<Failure, TokenEntity>> login(LoginParams params);
}
