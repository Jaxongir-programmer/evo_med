import 'package:dio/dio.dart';
import 'package:evo_med/core/network/api_endpoints.dart';
import 'package:evo_med/core/util/datasource/datasource_utils.dart';
import 'package:evo_med/core/util/params/common_params.dart';
import 'package:evo_med/features/common/data/data_source/common_datasource.dart';
import 'package:evo_med/features/common/data/models/attribute_model.dart';
import 'package:evo_med/features/common/data/models/attribute_value_model.dart';
import 'package:evo_med/features/common/data/models/location_model.dart';
import 'package:evo_med/features/common/data/models/service_model.dart';
import 'package:evo_med/features/estate_announcement/data/models/estate_announcement_card_model.dart';

class CommonDataSourceImpl with ApiEndPoints, DataSourceUtil implements CommonDataSource {
  final Dio _dio;

  CommonDataSourceImpl(this._dio);

  @override
  Future<List<String>> uploadFile(List<String> files) async {
    return await checkResponse(
      () async {
        final formData = FormData.fromMap({
          "files": files.map((file) async => MultipartFile.fromFileSync(file)).toList(),
        });
        final response = await _dio.post(
          uploadFileEndPoint,
          data: formData,
        );
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return response.data;
        } else {
          extractMessage(response);
        }
      },
    );
  }

  @override
  Future<List<LocationModel>> getLocations(LocationsParams params) async {
    return await checkResponse(
      () async {
        final response = await _dio.get(
          locationsEndPoint,
          queryParameters: params.toJson(),
        );
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          final result = List.from(response.data['data']).map((e) => LocationModel.fromJson(e)).toList();
          return result;
        } else {
          extractMessage(response);
        }
      },
    );
  }

  @override
  Future<List<AttributeModel>> getAttributes(AttributeParams params) async {
    return await checkResponse(
      () async {
        final response = await _dio.get(
          attributesEndPoint,
          queryParameters: params.toJson(),
        );
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          final result = List.from(response.data['data']).map((e) => AttributeModel.fromJson(e)).toList();
          return result;
        } else {
          extractMessage(response);
        }
      },
    );
  }

  @override
  Future<List<AttributeValueModel>> getAttributeValue(AttributeValueParams params) async {
    return await checkResponse(
      () async {
        final response = await _dio.get(
          attributesEndPoint,
          queryParameters: params.toJson(),
        );
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          final result = List.from(response.data['data']).map((e) => AttributeValueModel.fromJson(e)).toList();
          return result;
        } else {
          extractMessage(response);
        }
      },
    );
  }

  @override
  Future<List<CategoryModel>> getCategories(CategoriesParams params) async {
    return await checkResponse(
      () async {
        final response = await _dio.get(
          categoriesEndPoint,
          queryParameters: params.toJson(),
        );
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          final result = List.from(response.data['data']).map((e) => CategoryModel.fromJson(e)).toList();
          return result;
        } else {
          extractMessage(response);
        }
      },
    );
  }

  @override
  Future<List<ServiceModel>> getServices(ServiceParams params) async {
    return await checkResponse(
          () async {
        final response = await _dio.get(
          servicesEndPoint,
          queryParameters: params.toJson(),
        );
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          final result = List.from(response.data['data']).map((e) => ServiceModel.fromJson(e)).toList();
          return result;
        } else {
          extractMessage(response);
        }
      },
    );
  }
}
