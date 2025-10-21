import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/profile_params.dart';
import 'package:evo_med/features/profile/domain/entities/tariff_entity.dart';
import 'package:evo_med/features/profile/domain/entities/user_tariff_entity.dart';
import 'package:evo_med/features/profile/domain/repositories/profile_repository.dart';

class GetUserTariffsUseCase implements UseCase<List<UserTariffEntity>, NoParams> {
  final ProfileRepository profileRepository;

  GetUserTariffsUseCase({
    required this.profileRepository,
  });

  @override
  Future<Either<Failure, List<UserTariffEntity>>> call(NoParams params) async {
    return await profileRepository.getUserTariffs();
  }
}
