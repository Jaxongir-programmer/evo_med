import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/on_boarding/domain/entities/on_boarding_entity.dart';

abstract class OnBoardingRepository {
  Future<Either<Failure, List<OnBoardingEntity>>> getOnBoarding();

  Future<Either<Failure, void>> createDevice(CreateDeviceParams params);
}
