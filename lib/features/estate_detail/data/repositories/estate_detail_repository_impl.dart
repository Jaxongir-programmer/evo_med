import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/estate_detail/data/data_sources/estate_detail_datasource.dart';
import 'package:evo_med/features/estate_detail/domain/entities/estate_detail_entity.dart';
import 'package:evo_med/features/estate_detail/domain/repositories/estate_detail_repository.dart';


class EstateDetailRepositoryImpl with RepositoryUtil implements EstateDetailRepository {
    final EstateDetailDataSource estateDetailDataSource;
  
    EstateDetailRepositoryImpl({required this.estateDetailDataSource});
  
    @override
    Future<Either<Failure, EstateDetailEntity>> getEstateDetail(params) {
      return callSafely(() async {
        var result = await estateDetailDataSource.getEstateDetail(params);
        return result.toEntity();
      });
    }
}
    