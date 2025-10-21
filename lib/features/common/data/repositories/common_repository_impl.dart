import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/common_params.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/common/data/data_source/common_datasource.dart';
import 'package:evo_med/features/common/domain/entity/attribute_entity.dart';
import 'package:evo_med/features/common/domain/entity/attribute_value_entity.dart';
import 'package:evo_med/features/common/domain/entity/location_entity.dart';
import 'package:evo_med/features/common/domain/entity/service_entity.dart';
import 'package:evo_med/features/common/domain/repository/common_repository.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/category_entity.dart';

class CommonRepositoryImpl with RepositoryUtil implements CommonRepository {
  final CommonDataSource commonDataSource;

  CommonRepositoryImpl({required this.commonDataSource});

  @override
  Future<Either<Failure, List<String>>> uploadFile(List<String> files) {
    return callSafely(() async {
      var result = await commonDataSource.uploadFile(files);
      return result;
    });
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocations(LocationsParams params) {
    return callSafely(() async {
      var result = await commonDataSource.getLocations(params);
      return result.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<AttributeValueEntity>>> getAttributeValue(AttributeValueParams params) {
    return callSafely(() async {
      var result = await commonDataSource.getAttributeValue(params);
      return result.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<AttributeEntity>>> getAttributes(AttributeParams params) {
    return callSafely(() async {
      var result = await commonDataSource.getAttributes(params);
      return result.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories(CategoriesParams params) {
    return callSafely(() async {
      var result = await commonDataSource.getCategories(params);
      return result.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> getServices(ServiceParams params) {
    return callSafely(() async {
      var result = await commonDataSource.getServices(params);
      return result.map((e) => e.toEntity()).toList();
    });
  }
}
