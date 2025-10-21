import 'package:dio/dio.dart';
import 'package:evo_med/features/home/data/data_sources/home_datasource.dart';
import 'package:evo_med/features/home/data/models/home_statistic_model.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';
import 'package:evo_med/features/home/data/models/message_model.dart';

class HomeDataSourceImpl with ApiEndPoints, DataSourceUtil implements HomeDataSource {
  final Dio _dio;

  HomeDataSourceImpl(this._dio);

  @override
  Future<HomeStatisticModel> getHomeStatistics() async {
    return await checkResponse(() async {
      final response = await _dio.get(mainEndPoint);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return HomeStatisticModel.fromJson(response.data['data']);
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<List<MessageModel>> getMessages() async {
    return await checkResponse(
      () async {
        final response = await _dio.get(
          messagesEndPoint,
        );
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          final result = List.from(response.data['data']).map((e) => MessageModel.fromJson(e)).toList();
          return result;
        } else {
          extractMessage(response);
        }
      },
    );
  }
}
