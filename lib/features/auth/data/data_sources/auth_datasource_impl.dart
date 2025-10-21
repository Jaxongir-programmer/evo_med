import 'package:dio/dio.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/auth/data/data_sources/auth_datasource.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';
import 'package:evo_med/features/auth/data/models/token_model.dart';

class AuthDataSourceImpl with ApiEndPoints, DataSourceUtil implements AuthDataSource {
  final Dio _dio;

  AuthDataSourceImpl(this._dio);

  @override
  Future<void> getVerificationCode(params) async {
    return await checkResponse(() async {
      final response = await _dio.post(getVerificationCodeEndPoint, data: {
        'phone': params,
      });
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<bool> checkVerificationCode(VerificationCodeParams params) async {
    return await checkResponse(() async {
      final response = await _dio.post(
        checkVerificationCodeEndPoint,
        data: params.toJson(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        final result = response.data['data']['success'];
        return result;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<void> registerUser(RegisterParams params) async {
    return await checkResponse(() async {
      final response = await _dio.post(
        registerEndPoint,
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
  Future<void> forgotPassword(String params) async {
    return await checkResponse(() async {
      final response = await _dio.post(forgotPasswordEndPoint, data: {
        'phone': params,
      });
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw extractMessage(response);
      }
    });
  }

  @override
  Future<void> resetPassword(ResetPasswordParams params) async {
    return await checkResponse(() async {
      final response = await _dio.patch(
        resetPasswordEndPoint,
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
  Future<TokenModel> login(LoginParams params) async {
    return await checkResponse(() async {
      final response = await _dio.post(
        loginEndPoint,
        data: params.toJson(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return TokenModel.fromJson(response.data);
      } else {
        throw extractMessage(response);
      }
    });
  }
}
