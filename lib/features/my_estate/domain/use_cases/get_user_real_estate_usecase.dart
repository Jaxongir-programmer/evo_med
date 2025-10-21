import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/my_estate/domain/repositories/my_estate_repository.dart';
import 'package:evo_med/features/my_estate/domain/entities/user_real_estate_entity.dart';

class GetUserRealEstateUseCase implements UseCase<List<UserRealEstateEntity>, NoParams> {
  final MyEstateRepository myEstateRepository;

  GetUserRealEstateUseCase({
    required this.myEstateRepository,
  });

  @override
  Future<Either<Failure, List<UserRealEstateEntity>>> call(NoParams params) async {
    return await myEstateRepository.getUserRealEstateList();
  }
}
