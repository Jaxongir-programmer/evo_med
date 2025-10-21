import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/services/domain/repositories/services_repository.dart';
import 'package:evo_med/features/services/domain/entities/services_entity.dart';

class ServicesUseCase implements UseCase<ServicesEntity, String> {
  final ServicesRepository servicesRepository;
  ServicesUseCase({
    required this.servicesRepository,
  });

  @override
  Future<Either<Failure, ServicesEntity>> call(String params) async {
    return await servicesRepository.getServices(params);
  }
}
    