import 'package:dio/dio.dart';
import 'package:evo_med/features/estate_detail/data/models/estate_detail_model.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';


abstract class EstateDetailDataSource {     
  Future<EstateDetailModel> getEstateDetail(String params);
}

class EstateDetailDataSourceImpl with ApiEndPoints, DataSourceUtil implements EstateDetailDataSource {
  final Dio _dio;

  EstateDetailDataSourceImpl(this._dio);

  @override
  Future<EstateDetailModel> getEstateDetail(params) async {
     return await checkResponse<EstateDetailModel>(() async {
      final response = await _dio.post(
        placeEndPointsHere,
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return EstateDetailModel.fromJson(response.data);
      } else {
        throw extractMessage(response);
      }
    });
  }
}
    