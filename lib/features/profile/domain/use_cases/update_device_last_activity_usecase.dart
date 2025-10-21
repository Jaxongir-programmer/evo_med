import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/profile/domain/repositories/profile_repository.dart';

class UpdateDeviceLastActivityUseCase implements UseCase<void, String> {
  final ProfileRepository profileRepository;

  UpdateDeviceLastActivityUseCase({
    required this.profileRepository,
  });

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await profileRepository.updateDeviceLastActivity(params);
  }
}
