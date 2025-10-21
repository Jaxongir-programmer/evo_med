import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/on_boarding/domain/repositories/on_boarding_repository.dart';

class CreateDeviceUseCase implements UseCase<void, CreateDeviceParams> {
  final OnBoardingRepository onBoardingRepository;

  CreateDeviceUseCase({
    required this.onBoardingRepository,
  });

  @override
  Future<Either<Failure, void>> call(CreateDeviceParams params) async {
    return await onBoardingRepository.createDevice(params);
  }
}
