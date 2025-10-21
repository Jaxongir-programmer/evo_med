import 'package:dio/dio.dart';
import 'package:evo_med/core/util/params/my_estate_params.dart';
import 'package:evo_med/features/my_estate/data/data_sources/my_estate_datasource.dart';
import 'package:evo_med/features/my_estate/data/models/identification_model.dart';
import 'package:evo_med/features/my_estate/data/models/init_identification_model.dart';
import 'package:evo_med/features/my_estate/data/models/user_real_estate_model.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';
import 'package:evo_med/features/my_estate/data/models/user_car_model.dart';

class MyEstateDataSourceImpl with ApiEndPoints, DataSourceUtil implements MyEstateDataSource {
  final Dio _dio;

  MyEstateDataSourceImpl(this._dio);

  @override
  Future<InitIdentificationModel> initIdentification() async {
    return await checkResponse(() async {
      final response = await _dio.post(initIdentificationEndPoint);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<IdentificationModel> identify(IdentificationParams params) async {
    return await checkResponse(() async {
      final response = await _dio.post(
        identifyEndPoint,
        data: params.toJson(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return InitIdentificationModel.fromJson(response.data);
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<List<UserRealEstateModel>> getUserRealEstateList() async {
    return await checkResponse(() async {
      final response = await _dio.get(userEstateEndPoint);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        List<UserRealEstateModel> myEstateList = [];
        for (var item in response.data['data']) {
          myEstateList.add(UserRealEstateModel.fromJson(item));
        }
        return myEstateList;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<List<UserCarModel>> getUserCarList() async {
    return await checkResponse(() async {
      final response = await _dio.get(userCarEndPoint);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        List<UserCarModel> myEstateList = [];
        for (var item in response.data['data']) {
          myEstateList.add(UserCarModel.fromJson(item));
        }
        return myEstateList;
      } else {
        throw extractMessage(response);
      }
    });
  }
}
