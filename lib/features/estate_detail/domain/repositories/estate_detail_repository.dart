import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/estate_detail/domain/entities/estate_detail_entity.dart';

abstract class EstateDetailRepository {
  Future<Either<Failure, EstateDetailEntity>> getEstateDetail(String params);
}
    