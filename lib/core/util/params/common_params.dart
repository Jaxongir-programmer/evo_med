class LocationsParams {
  final int parentId;
  final String title;
  final String code;

  LocationsParams({
    this.parentId = 0,
    this.title = '',
    this.code = '',
  });

  Map<String, dynamic> toJson() {
    var params = <String, dynamic>{};
    if (parentId != 0) {
      params['parent_id'] = parentId;
    }
    if (title.isNotEmpty) {
      params['title'] = title;
    }
    if (code.isNotEmpty) {
      params['code'] = code;
    }

    return params;
  }
}

class AttributeParams {
  final int categoryId;
  final String serviceId;

  AttributeParams({
    this.categoryId = 0,
    this.serviceId = "",
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {};

    if (categoryId != 0) {
      params['category_id'] = categoryId;
    }
    if (serviceId.isNotEmpty) {
      params['service_id'] = serviceId;
    }
    return params;
  }
}

class AttributeValueParams {
  final int attributeId;

  AttributeValueParams({
    this.attributeId = 0,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {};

    if (attributeId != 0) {
      params['attribute_id'] = attributeId;
    }
    return params;
  }
}

class CategoriesParams {
  final int parentId;

  CategoriesParams({
    this.parentId = 0,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {};

    if (parentId != 0) {
      params['parent_id'] = parentId;
    }
    return params;
  }
}

class RegionParams {
  final int parentId;
  final int code;
  final String title;

  RegionParams({
    this.parentId = 0,
    this.code = 0,
    this.title = '',
  });

  Map<String, dynamic> toJson() {
    var params = <String, dynamic>{};
    if (parentId != 0) {
      params['parent_id'] = parentId;
    }
    if (code != 0) {
      params['code'] = code;
    }
    if (title.isNotEmpty) {
      params['title'] = title;
    }

    return params;
  }
}

class ServiceParams {
  final String categoryId;

  ServiceParams({
    this.categoryId = "",
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {};

    if (categoryId.isNotEmpty) {
      params['category_id'] = categoryId;
    }
    return params;
  }
}
