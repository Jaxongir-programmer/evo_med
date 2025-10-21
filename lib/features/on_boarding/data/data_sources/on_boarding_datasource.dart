import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/on_boarding/data/models/on_boarding_model.dart';

abstract class OnBoardingDataSource {
  Future<List<OnBoardingModel>> getOnBoarding();

  Future<void> createUserDevice(CreateDeviceParams params);
}
