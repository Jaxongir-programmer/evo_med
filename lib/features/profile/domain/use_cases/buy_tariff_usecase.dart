import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/profile_params.dart';
import 'package:evo_med/features/profile/domain/repositories/profile_repository.dart';

class BuyTariffUseCase implements UseCase<void, TariffParams> {
  final ProfileRepository profileRepository;

  BuyTariffUseCase({
    required this.profileRepository,
  });

  @override
  Future<Either<Failure, void>> call(TariffParams params) async {
    return await profileRepository.buyTariff(params);
  }
}
