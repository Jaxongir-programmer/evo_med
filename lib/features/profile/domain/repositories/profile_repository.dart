import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/profile_params.dart';
import 'package:evo_med/features/profile/domain/entities/profile_entity.dart';
import 'package:evo_med/features/profile/domain/entities/tariff_entity.dart';
import 'package:evo_med/features/profile/domain/entities/user_tariff_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile(String params);

  Future<Either<Failure, void>> updateUserActivity();

  Future<Either<Failure, void>> updateDeviceLastActivity(String params);

  Future<Either<Failure, List<TariffEntity>>> getTariffs(TariffParams params);

  Future<Either<Failure, void>> buyTariff(TariffParams params);

  Future<Either<Failure, List<UserTariffEntity>>> getUserTariffs();
}
