import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/my_estate/domain/entities/init_identification_entity.dart';
import 'package:evo_med/features/my_estate/domain/repositories/my_estate_repository.dart';

class InitIdentificationUseCase implements UseCase<InitIdentificationEntity, NoParams> {
  final MyEstateRepository myEstateRepository;

  InitIdentificationUseCase({
    required this.myEstateRepository,
  });

  @override
  Future<Either<Failure, InitIdentificationEntity>> call(NoParams params) async {
    return await myEstateRepository.initIdentification();
  }
}
