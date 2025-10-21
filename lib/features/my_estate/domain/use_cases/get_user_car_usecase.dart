import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/my_estate/domain/entities/user_car_entity.dart';
import 'package:evo_med/features/my_estate/domain/repositories/my_estate_repository.dart';

class GetUserCarUseCase implements UseCase<List<UserCarEntity>, NoParams> {
  final MyEstateRepository myEstateRepository;

  GetUserCarUseCase({
    required this.myEstateRepository,
  });

  @override
  Future<Either<Failure, List<UserCarEntity>>> call(NoParams params) async {
    return await myEstateRepository.getUserCarList();
  }
}
