import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/services/domain/entities/services_entity.dart';

abstract class ServicesRepository {
  Future<Either<Failure, ServicesEntity>> getServices(String params);
}
    