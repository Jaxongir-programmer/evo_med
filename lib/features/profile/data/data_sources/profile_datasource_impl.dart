import 'package:dio/dio.dart';
import 'package:evo_med/core/util/params/profile_params.dart';
import 'package:evo_med/features/profile/data/data_sources/profile_datasource.dart';
import 'package:evo_med/features/profile/data/models/profile_model.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';
import 'package:evo_med/features/profile/data/models/tariff_model.dart';
import 'package:evo_med/features/profile/data/models/user_tariff_model.dart';

class ProfileDataSourceImpl with ApiEndPoints, DataSourceUtil implements ProfileDataSource {
  final Dio _dio;

  ProfileDataSourceImpl(this._dio);

  @override
  Future<ProfileModel> getProfileInfo(params) async {
    return await checkResponse(() async {
      final response = await _dio.post(
        userInfoEndPoint,
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return ProfileModel.fromJson(response.data['data']);
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<void> updateDeviceLastActivity(String params) async {
    return await checkResponse(() async {
      final response = await _dio.patch(
        '$deviceLastActivityEndPoint$params',
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<void> updateUserActivity() async {
    return await checkResponse(() async {
      final response = await _dio.post(
        userActivityEndPoint,
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<List<TariffModel>> getTariffs(TariffParams params) async {
    return await checkResponse(() async {
      final response = await _dio.get(
        tariffsEndPoint,
        data: params.toJson(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        final result = List.from(response.data['data']).map((e) => TariffModel.fromJson(e)).toList();
        return result;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<void> buyTariff(TariffParams params) async {
    return await checkResponse(() async {
      final response = await _dio.post(
        buyTariffsEndPoint.replaceAll("{}", params.id.toString()),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<List<UserTariffModel>> getUserTariffs() async {
    return await checkResponse(() async {
      final response = await _dio.get(
        userTariffsEndPoint,
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        final result = List.from(response.data['data']).map((e) => UserTariffModel.fromJson(e)).toList();
        return result;
      } else {
        throw extractMessage(response);
      }
    });
  }
}
