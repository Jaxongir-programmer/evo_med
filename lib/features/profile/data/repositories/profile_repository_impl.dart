import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/profile_params.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/profile/data/data_sources/profile_datasource.dart';
import 'package:evo_med/features/profile/domain/entities/profile_entity.dart';
import 'package:evo_med/features/profile/domain/entities/tariff_entity.dart';
import 'package:evo_med/features/profile/domain/entities/user_tariff_entity.dart';
import 'package:evo_med/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl with RepositoryUtil implements ProfileRepository {
  final ProfileDataSource profileDataSource;

  ProfileRepositoryImpl({required this.profileDataSource});

  @override
  Future<Either<Failure, ProfileEntity>> getProfile(params) {
    return callSafely(() async {
      var result = await profileDataSource.getProfileInfo(params);
      return result.toEntity();
    });
  }

  @override
  Future<Either<Failure, void>> updateDeviceLastActivity(String params) {
    return callSafely(() async {
      return await profileDataSource.updateDeviceLastActivity(params);
    });
  }

  @override
  Future<Either<Failure, void>> updateUserActivity() {
    return callSafely(() async {
      return await profileDataSource.updateUserActivity();
    });
  }

  @override
  Future<Either<Failure, List<TariffEntity>>> getTariffs(TariffParams params) {
    return callSafely(() async {
      final result = await profileDataSource.getTariffs(params);
      return result.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, void>> buyTariff(TariffParams params) {
    return callSafely(() async {
      final result = await profileDataSource.buyTariff(params);
      return result;
    });
  }

  @override
  Future<Either<Failure, List<UserTariffEntity>>> getUserTariffs() {
    return callSafely(() async {
      final result = await profileDataSource.getUserTariffs();
      return result.map((e) => e.toEntity()).toList();
    });
  }
}
