import 'package:dio/dio.dart';
import 'package:evo_med/features/services/data/models/services_model.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';


abstract class ServicesDataSource {     
  Future<ServicesModel> getServices(String params);
}

class ServicesDataSourceImpl with ApiEndPoints, DataSourceUtil implements ServicesDataSource {
  final Dio _dio;

  ServicesDataSourceImpl(this._dio);

  @override
  Future<ServicesModel> getServices(params) async {
     return await checkResponse<ServicesModel>(() async {
      final response = await _dio.post(
        placeEndPointsHere,
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return ServicesModel.fromJson(response.data);
      } else {
        throw extractMessage(response);
      }
    });
  }
}
    