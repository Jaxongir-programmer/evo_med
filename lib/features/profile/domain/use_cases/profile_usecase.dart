import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/profile/domain/repositories/profile_repository.dart';
import 'package:evo_med/features/profile/domain/entities/profile_entity.dart';

class ProfileUseCase implements UseCase<ProfileEntity, String> {
  final ProfileRepository profileRepository;
  ProfileUseCase({
    required this.profileRepository,
  });

  @override
  Future<Either<Failure, ProfileEntity>> call(String params) async {
    return await profileRepository.getProfile(params);
  }
}
    