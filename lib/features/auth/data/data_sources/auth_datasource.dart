import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/auth/data/models/token_model.dart';

abstract class AuthDataSource {
  Future<void> getVerificationCode(String params);

  Future<bool> checkVerificationCode(VerificationCodeParams params);

  Future<void> registerUser(RegisterParams params);

  Future<void> forgotPassword(String params);

  Future<void> resetPassword(ResetPasswordParams params);

  Future<TokenModel> login(LoginParams params);

}
