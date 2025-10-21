import 'package:dio/dio.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/services/shared_preference_manager.dart';
import 'package:evo_med/core/util/my_functions.dart';

class CustomInterceptor implements Interceptor {
  final Dio dio;
  int maxRetries = 0;

  CustomInterceptor({required this.dio});

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (shouldRetry(err) && (maxRetries < 3)) {
      maxRetries += 1;
      dio.request(
        err.requestOptions.path,
        options: Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
          extra: err.requestOptions.extra,
          contentType: err.requestOptions.contentType,
        ),
      );
      return;
    } else if (err.type == DioExceptionType.badResponse &&
        (err.response?.statusCode == 403 || err.response?.statusCode == 401)) {
      SharedPreferenceManager.deleteString(AppConstants.token);
      await _refreshToken(err.requestOptions.baseUrl);
      if (SharedPreferenceManager.getString(AppConstants.token).replaceAll('Bearer', '').trim().isNotEmpty) {
        err.requestOptions.headers['Authorization'] = SharedPreferenceManager.getString(AppConstants.token);
      }
      final response = await _resolveResponse(err.requestOptions);
      handler.resolve(response);
      return;
    }
    handler.next(err);
  }

  bool shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final deviceId = (await MyFunctions.getDeviceInfo())['deviceId'];
    if (SharedPreferenceManager.getString(AppConstants.token, defValue: '').isNotEmpty) {
      options.headers['Authorization'] = SharedPreferenceManager.getString(AppConstants.token);
    } else {
      options.headers.remove('Authorization');
    }
    options.headers['Accept-Language'] = SharedPreferenceManager.getString(AppConstants.language, defValue: 'uz');
    options.headers.addAll({'deviceId': deviceId});
    handler.next(options);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    if ((response.statusCode == 403 || response.statusCode == 401)) {
      if (SharedPreferenceManager.getString(AppConstants.refreshToken).isEmpty) {
        SharedPreferenceManager.deleteString(AppConstants.token);
        handler.next(response);
        return;
      }
      await _refreshToken(response.requestOptions.baseUrl);
      if (SharedPreferenceManager.getString(AppConstants.token).replaceAll('Bearer', '').trim().isNotEmpty) {
        response.requestOptions.headers['Authorization'] = SharedPreferenceManager.getString(AppConstants.token);
      }
      final resolved = await _resolveResponse(response.requestOptions);
      handler.resolve(resolved);
      return;
    }
    maxRetries = 0;
    handler.next(response);
  }

  Future<void> _refreshToken(String baseUrl) async {
    final refreshToken = SharedPreferenceManager.getString(AppConstants.refreshToken, defValue: "");
    if (refreshToken.isNotEmpty) {
      Dio refreshDio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 35),
          receiveTimeout: const Duration(seconds: 35),
          sendTimeout: const Duration(seconds: 35),
          validateStatus: (status) => status != null && status <= 500,
        ),
      );
      refreshDio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
        requestHeader: true,
      ));

      final response = await refreshDio.post(
        '$baseUrl/auth/refresh-token',
        data: {
          "refresh_token": refreshToken,
        },
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        SharedPreferenceManager.putString(AppConstants.token, 'Bearer ${response.data['token']}');
      } else {
        SharedPreferenceManager.deleteString(AppConstants.token);
        SharedPreferenceManager.deleteString(AppConstants.refreshToken);
        // serviceLocator.get<ProfileBloc>().add(Logout(onSuccess: () {}, unAuth: true));
      }
    }
  }

  Future<Response<dynamic>> _resolveResponse(RequestOptions options) async {
    final path = options.path.replaceAll(AppConstants.baseUrl, '');
    if (options.data is FormData) {
      FormData formData = FormData();
      final fields = options.data.fields as List<MapEntry<String, String>>;
      formData.fields.addAll(fields);

      for (MapEntry mapFile in options.data.files) {
        formData.files.add(
          MapEntry(
            mapFile.key,
            MultipartFile.fromFileSync(
              fields
                  .firstWhere(
                    (element) => element.key == 'photo_path',
                    orElse: () => const MapEntry('', ''),
                  )
                  .value,
              filename: mapFile.value.filename,
            ),
          ),
        );
      }
      options.data = formData;
    }
    return await dio.request(AppConstants.baseUrl + path,
        data: options.data,
        queryParameters: options.queryParameters,
        options: Options(
          headers: options.headers,
          method: options.method,
        ));
  }
}
