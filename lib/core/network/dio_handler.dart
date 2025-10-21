import 'package:dio/dio.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/network/interceptor/custom_interceptor.dart';
import 'package:evo_med/core/services/shared_preference_manager.dart';

import '../../main.dart';

class DioSettings {
  BaseOptions _dioBaseOptions({String? baseUrl}) => BaseOptions(
        baseUrl: baseUrl ?? AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 35),
        receiveTimeout: const Duration(seconds: 35),
        sendTimeout: const Duration(seconds: 35),
        followRedirects: false,
        headers: {
          'Authorization': SharedPreferenceManager.getString(
            AppConstants.token,
            defValue: '',
          ),
          'Accept-Language': SharedPreferenceManager.getString(
            AppConstants.language,
            defValue: 'uz',
          ),
          "Content-Type": "application/json",
        },
        validateStatus: (status) => status != null && status <= 500,
      );

  Dio dio({String? baseurl}) {
    final Dio dio = Dio(_dioBaseOptions(baseUrl: baseurl));
    dio.interceptors
      ..add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
        requestHeader: true,
      ))
      ..add(CustomInterceptor(dio: dio));

    dio.interceptors.add(MyApp.alice.getDioInterceptor());

    /// Enable alice for testing
    if (SharedPreferenceManager.getBool(AppConstants.aliceState, defValue: false)) {
      // dio.interceptors.add(alice.getDioInterceptor());
    }

    return dio;
  }
}
