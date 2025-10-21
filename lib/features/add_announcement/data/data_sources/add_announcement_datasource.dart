import 'package:dio/dio.dart';
import 'package:evo_med/features/add_announcement/data/models/add_announcement_model.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';


abstract class AddAnnouncementDataSource {     
  Future<AddAnnouncementModel> getAddAnnouncement(String params);
}

class AddAnnouncementDataSourceImpl with ApiEndPoints, DataSourceUtil implements AddAnnouncementDataSource {
  final Dio _dio;

  AddAnnouncementDataSourceImpl(this._dio);

  @override
  Future<AddAnnouncementModel> getAddAnnouncement(params) async {
     return await checkResponse<AddAnnouncementModel>(() async {
      final response = await _dio.post(
        placeEndPointsHere,
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return AddAnnouncementModel.fromJson(response.data);
      } else {
        throw extractMessage(response);
      }
    });
  }
}
    