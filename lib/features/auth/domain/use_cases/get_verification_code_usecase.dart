import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/auth/domain/repositories/auth_repository.dart';

class GetVerificationCodeUseCase implements UseCase<void, String> {
  final AuthRepository authRepository;
  GetVerificationCodeUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await authRepository.getVerificationCode(params);
  }
}
    