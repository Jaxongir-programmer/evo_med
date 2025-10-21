import 'package:dio/dio.dart';
import 'package:evo_med/core/util/params/real_estate_params.dart';
import 'package:evo_med/features/common/data/models/generic_pagination.dart';
import 'package:evo_med/features/estate_announcement/data/data_sources/estate_announcement_datasource.dart';
import 'package:evo_med/features/estate_announcement/data/models/estate_announcement_card_model.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';

class EstateAnnouncementDataSourceImpl with ApiEndPoints, DataSourceUtil implements EstateAnnouncementDataSource {
  final Dio _dio;

  EstateAnnouncementDataSourceImpl(this._dio);

  @override
  Future<PaginationList<EstateAnnouncementCardModel>> getRealEstateAnnouncement(RealEstateParams params) async {
    return await checkResponse(() async {
      final response = await _dio.get(
        realEstateAnnouncementEndPoint,
        // queryParameters: params.toJson(),
        queryParameters: params.toQueryParams(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        final list = (response.data['data'] as List).map((e) => EstateAnnouncementCardModel.fromJson(e)).toList();
        final totalCount = response.data['pagination']['total'];
        return PaginationList(result: list, totalCount: totalCount);
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<int> getRealEstateAnnouncementCount(RealEstateParams params) async {
    return await checkResponse(() async {
      final response = await _dio.get(
        realEstateAnnouncementEndPoint,
        queryParameters: params.toQueryParams(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        final count = (response.data['data']["count"]);
        return count;
      } else {
        throw extractMessage(response);
      }
    });
  }
}
