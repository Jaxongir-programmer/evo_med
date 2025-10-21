import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/on_boarding/data/data_sources/on_boarding_datasource.dart';
import 'package:evo_med/features/on_boarding/domain/entities/on_boarding_entity.dart';
import 'package:evo_med/features/on_boarding/domain/repositories/on_boarding_repository.dart';

class OnBoardingRepositoryImpl with RepositoryUtil implements OnBoardingRepository {
  final OnBoardingDataSource onBoardingDataSource;

  OnBoardingRepositoryImpl({required this.onBoardingDataSource});

  @override
  Future<Either<Failure, List<OnBoardingEntity>>> getOnBoarding() {
    return callSafely(() async {
      var result = await onBoardingDataSource.getOnBoarding();
      return result.map((e) => e.toEntity()).toList();
    });
  }


  @override
  Future<Either<Failure, void>> createDevice(CreateDeviceParams params) {
    return callSafely(() async {
      var result = await onBoardingDataSource.createUserDevice(params);
      return result;
    });
  }
}
