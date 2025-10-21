import 'package:evo_med/core/util/params/common_params.dart';
import 'package:evo_med/features/common/data/models/attribute_model.dart';
import 'package:evo_med/features/common/data/models/attribute_value_model.dart';
import 'package:evo_med/features/common/data/models/location_model.dart';
import 'package:evo_med/features/common/data/models/service_model.dart';
import 'package:evo_med/features/estate_announcement/data/models/estate_announcement_card_model.dart';

abstract class CommonDataSource {
  Future<List<String>> uploadFile(List<String> files);

  Future<List<LocationModel>> getLocations(LocationsParams params);

  Future<List<AttributeModel>> getAttributes(AttributeParams params);

  Future<List<AttributeValueModel>> getAttributeValue(AttributeValueParams params);

  Future<List<CategoryModel>> getCategories(CategoriesParams params);

  Future<List<ServiceModel>> getServices(ServiceParams params);

}
