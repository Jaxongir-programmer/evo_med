import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/auth/domain/entities/token_entity.dart';
import 'package:evo_med/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<TokenEntity, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, TokenEntity>> call(LoginParams params) async {
    return await authRepository.login(params);
  }
}
