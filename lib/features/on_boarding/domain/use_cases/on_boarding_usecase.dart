import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:evo_med/features/on_boarding/domain/entities/on_boarding_entity.dart';

class OnBoardingUseCase implements UseCase<List<OnBoardingEntity>, NoParams> {
  final OnBoardingRepository onBoardingRepository;

  OnBoardingUseCase({
    required this.onBoardingRepository,
  });

  @override
  Future<Either<Failure, List<OnBoardingEntity>>> call(NoParams params) async {
    return await onBoardingRepository.getOnBoarding();
  }
}
