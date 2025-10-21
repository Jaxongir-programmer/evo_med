import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/estate_detail/domain/repositories/estate_detail_repository.dart';
import 'package:evo_med/features/estate_detail/domain/entities/estate_detail_entity.dart';

class EstateDetailUseCase implements UseCase<EstateDetailEntity, String> {
  final EstateDetailRepository estateDetailRepository;
  EstateDetailUseCase({
    required this.estateDetailRepository,
  });

  @override
  Future<Either<Failure, EstateDetailEntity>> call(String params) async {
    return await estateDetailRepository.getEstateDetail(params);
  }
}
    