import 'package:evo_med/core/util/params/my_estate_params.dart';
import 'package:evo_med/features/my_estate/data/models/identification_model.dart';
import 'package:evo_med/features/my_estate/data/models/init_identification_model.dart';
import 'package:evo_med/features/my_estate/data/models/user_real_estate_model.dart';
import 'package:evo_med/features/my_estate/data/models/user_car_model.dart';

abstract class MyEstateDataSource {
  Future<InitIdentificationModel> initIdentification();

  Future<IdentificationModel> identify(IdentificationParams params);

  Future<List<UserRealEstateModel>> getUserRealEstateList();

  Future<List<UserCarModel>> getUserCarList();
}
