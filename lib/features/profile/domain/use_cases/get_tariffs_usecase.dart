import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/profile_params.dart';
import 'package:evo_med/features/profile/domain/entities/tariff_entity.dart';
import 'package:evo_med/features/profile/domain/repositories/profile_repository.dart';

class GetTariffsUseCase implements UseCase<List<TariffEntity>, TariffParams> {
  final ProfileRepository profileRepository;

  GetTariffsUseCase({
    required this.profileRepository,
  });

  @override
  Future<Either<Failure, List<TariffEntity>>> call(TariffParams params) async {
    return await profileRepository.getTariffs(params);
  }
}
