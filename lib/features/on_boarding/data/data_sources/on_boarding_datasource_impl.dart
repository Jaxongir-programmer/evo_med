import 'package:dio/dio.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/on_boarding/data/data_sources/on_boarding_datasource.dart';
import 'package:evo_med/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';

class OnBoardingDataSourceImpl with ApiEndPoints, DataSourceUtil implements OnBoardingDataSource {
  final Dio _dio;

  OnBoardingDataSourceImpl(this._dio);

  @override
  Future<List<OnBoardingModel>> getOnBoarding() async {
    return await checkResponse(() async {
      final response = await _dio.get(mainOnBoardingEndPoint);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        final List<OnBoardingModel> onBoardingList = [];
        for (var item in response.data['data']) {
          onBoardingList.add(OnBoardingModel.fromJson(item));
        }
        return onBoardingList;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<void> createUserDevice(CreateDeviceParams params) async {
    return await checkResponse(() async {
      final response = await _dio.post(
        createDeviceEndPoint,
        data: params.toJson(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      } else {
        throw extractMessage(response);
      }
    });
  }
}
