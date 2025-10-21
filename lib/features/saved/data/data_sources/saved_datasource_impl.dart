import 'package:dio/dio.dart';
import 'package:evo_med/core/util/params/saved_params.dart';
import 'package:evo_med/features/add_announcement/data/models/add_announcement_model.dart';
import 'package:evo_med/features/estate_announcement/data/models/estate_announcement_card_model.dart';
import 'package:evo_med/features/saved/data/data_sources/saved_datasource.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';

class SavedDataSourceImpl with ApiEndPoints, DataSourceUtil implements SavedDataSource {
  final Dio _dio;

  SavedDataSourceImpl(this._dio);

  @override
  Future<EstateAnnouncementCardModel> addToSaved(SavedParams params) async {
    return await checkResponse(() async {
      final response = await _dio.post(
        favoritesEndPoint,
        data: params.toJson(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return EstateAnnouncementCardModel.fromJson(response.data['data']);
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<void> deleteSaved(SavedParams params) async {
    return await checkResponse(() async {
      final response = await _dio.delete(
        '$favoritesEndPoint/${params.announcementId}',
        data: params.toJson(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<void> updateSaved(SavedParams params) async {
    return await checkResponse(() async {
      final response = await _dio.patch(
        '$favoritesEndPoint/${params.announcementId}',
        data: params.toJson(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<List<EstateAnnouncementCardModel>> getSavedList(SavedParams params) async {
    return await checkResponse(() async {
      final response = await _dio.get(
        favoritesEndPoint,
        queryParameters: params.toJson(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        final list = (response.data['data'] as List).map((e) => EstateAnnouncementCardModel.fromJson(e)).toList();
        return list;
      } else {
        throw extractMessage(response);
      }
    });
  }
}
