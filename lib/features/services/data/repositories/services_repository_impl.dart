import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/services/data/data_sources/services_datasource.dart';
import 'package:evo_med/features/services/domain/entities/services_entity.dart';
import 'package:evo_med/features/services/domain/repositories/services_repository.dart';


class ServicesRepositoryImpl with RepositoryUtil implements ServicesRepository {
    final ServicesDataSource servicesDataSource;
  
    ServicesRepositoryImpl({required this.servicesDataSource});
  
    @override
    Future<Either<Failure, ServicesEntity>> getServices(params) {
      return callSafely(() async {
        var result = await servicesDataSource.getServices(params);
        return result.toEntity();
      });
    }
}
    