import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<void, RegisterParams> {
  final AuthRepository authRepository;
  RegisterUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(RegisterParams params) async {
    return await authRepository.register(params);
  }
}
    