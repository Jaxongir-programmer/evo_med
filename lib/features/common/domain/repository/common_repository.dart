import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/common_params.dart';
import 'package:evo_med/features/common/domain/entity/attribute_entity.dart';
import 'package:evo_med/features/common/domain/entity/attribute_value_entity.dart';
import 'package:evo_med/features/common/domain/entity/location_entity.dart';
import 'package:evo_med/features/common/domain/entity/service_entity.dart';
import 'package:evo_med/features/estate_announcement/data/models/estate_announcement_card_model.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/category_entity.dart';

abstract class CommonRepository {
  Future<Either<Failure, List<String>>> uploadFile(List<String> files);

  Future<Either<Failure, List<LocationEntity>>> getLocations(LocationsParams params);

  Future<Either<Failure, List<AttributeEntity>>> getAttributes(AttributeParams params);

  Future<Either<Failure, List<AttributeValueEntity>>> getAttributeValue(AttributeValueParams params);

  Future<Either<Failure, List<CategoryEntity>>> getCategories(CategoriesParams params);

  Future<Either<Failure, List<ServiceEntity>>> getServices(ServiceParams params);
}
