import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/common_params.dart';
import 'package:evo_med/features/common/domain/entity/attribute_entity.dart';
import 'package:evo_med/features/common/domain/entity/location_entity.dart';
import 'package:evo_med/features/common/domain/entity/service_entity.dart';
import 'package:evo_med/features/common/domain/repository/common_repository.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/category_entity.dart';

class GetServicesUseCase extends UseCase<List<ServiceEntity>, ServiceParams> {
  final CommonRepository repository;

  GetServicesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ServiceEntity>>> call(ServiceParams params) async {
    return await repository.getServices(params);
  }
}
