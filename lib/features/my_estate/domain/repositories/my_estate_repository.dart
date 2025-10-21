import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/my_estate_params.dart';
import 'package:evo_med/features/my_estate/domain/entities/identification_entity.dart';
import 'package:evo_med/features/my_estate/domain/entities/init_identification_entity.dart';
import 'package:evo_med/features/my_estate/domain/entities/user_real_estate_entity.dart';
import 'package:evo_med/features/my_estate/domain/entities/user_car_entity.dart';

abstract class MyEstateRepository {
  Future<Either<Failure, InitIdentificationEntity>> initIdentification();

  Future<Either<Failure, IdentificationEntity>> identify(IdentificationParams params);

  Future<Either<Failure, List<UserRealEstateEntity>>> getUserRealEstateList();

  Future<Either<Failure, List<UserCarEntity>>> getUserCarList();
}
