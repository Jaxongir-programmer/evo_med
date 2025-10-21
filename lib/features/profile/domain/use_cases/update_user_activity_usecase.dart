import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/profile/domain/repositories/profile_repository.dart';

class UpdateUserActivityUseCase implements UseCase<void, NoParams> {
  final ProfileRepository profileRepository;

  UpdateUserActivityUseCase({
    required this.profileRepository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await profileRepository.updateUserActivity();
  }
}
