import 'package:evo_med/core/util/params/profile_params.dart';
import 'package:evo_med/features/profile/data/models/profile_model.dart';
import 'package:evo_med/features/profile/data/models/tariff_model.dart';
import 'package:evo_med/features/profile/data/models/user_tariff_model.dart';

abstract class ProfileDataSource {
  Future<ProfileModel> getProfileInfo(String params);

  Future<void> updateUserActivity();

  Future<void> updateDeviceLastActivity(String params);

  Future<List<TariffModel>> getTariffs(TariffParams params);

  Future<void> buyTariff(TariffParams params);

  Future<List<UserTariffModel>> getUserTariffs();
}
