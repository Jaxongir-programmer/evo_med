import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/my_estate_params.dart';
import 'package:evo_med/features/my_estate/domain/entities/identification_entity.dart';
import 'package:evo_med/features/my_estate/domain/repositories/my_estate_repository.dart';

class IdentifyUsecase implements UseCase<IdentificationEntity, IdentificationParams> {
  final MyEstateRepository myEstateRepository;

  IdentifyUsecase({
    required this.myEstateRepository,
  });

  @override
  Future<Either<Failure, IdentificationEntity>> call(IdentificationParams params) async {
    return await myEstateRepository.identify(params);
  }
}
