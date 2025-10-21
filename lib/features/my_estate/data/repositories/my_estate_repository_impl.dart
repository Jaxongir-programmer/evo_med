import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/my_estate_params.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/my_estate/data/data_sources/my_estate_datasource.dart';
import 'package:evo_med/features/my_estate/domain/entities/identification_entity.dart';
import 'package:evo_med/features/my_estate/domain/entities/init_identification_entity.dart';
import 'package:evo_med/features/my_estate/domain/entities/user_car_entity.dart';
import 'package:evo_med/features/my_estate/domain/entities/user_real_estate_entity.dart';
import 'package:evo_med/features/my_estate/domain/repositories/my_estate_repository.dart';

class MyEstateRepositoryImpl with RepositoryUtil implements MyEstateRepository {
  final MyEstateDataSource myEstateDataSource;

  MyEstateRepositoryImpl({required this.myEstateDataSource});

  @override
  Future<Either<Failure, InitIdentificationEntity>> initIdentification() {
    return callSafely(() async {
      var result = await myEstateDataSource.initIdentification();
      return result.toEntity();
    });
  }

  @override
  Future<Either<Failure, IdentificationEntity>> identify(IdentificationParams params) {
    return callSafely(() async {
      var result = await myEstateDataSource.identify(params);
      return result.toEntity();
    });
  }

  @override
  Future<Either<Failure, List<UserRealEstateEntity>>> getUserRealEstateList() {
    return callSafely(() async {
      var result = await myEstateDataSource.getUserRealEstateList();
      return result.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<UserCarEntity>>> getUserCarList() {
    return callSafely(() async {
      var result = await myEstateDataSource.getUserCarList();
      return result.map((e) => e.toEntity()).toList();
    });
  }
}
