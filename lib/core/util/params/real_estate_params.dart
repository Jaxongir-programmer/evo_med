import 'package:evo_med/core/util/enums/enums.dart';

class RealEstateParams {
  final String type;
  final int serviceId;
  final List<int> categoryIds;
  final int userId;
  final OrderType order;
  final OrderType priceOrder;
  final String status;
  final List<String> regions;
  final List<String> districts;
  final List<String> infrastructures;
  final double priceFrom;
  final double priceTo;
  final String currency;
  final String sort;
  final int roomCount;
  final int floorCount;
  final int floor;
  final List<String> homeDetails;
  final List<String> buildingMaterials;
  final List<String> priceOptions;
  final double latitude;
  final double longitude;
  final int radius;
  final int page;
  final int perPage;
  final bool count;

  RealEstateParams({
    this.type = 'estate',
    required this.serviceId,
    this.categoryIds = const [],
    this.userId = 0,
    this.order = OrderType.asc,
    this.priceOrder = OrderType.asc,
    this.status = '',
    this.regions = const [],
    this.districts = const [],
    this.infrastructures = const [],
    this.priceFrom = 0.0,
    this.priceTo = 0.0,
    this.currency = 'uzs',
    this.sort = '',
    this.roomCount = 0,
    this.floorCount = 0,
    this.floor = 0,
    this.homeDetails = const [],
    this.buildingMaterials = const [],
    this.priceOptions = const [],
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.radius = 0,
    this.page = 1,
    this.perPage = 20,
    this.count = false,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {
      'service_id': serviceId,
    };

    if (type.isNotEmpty) {
      params['type'] = type;
    }

    if (categoryIds.isNotEmpty) {
      params['category_ids'] = categoryIds;
    }
    if (userId != 0) {
      params['user_id'] = userId;
    }
    if (order.isAsc) {
      params['order'] = order.name;
    }
    if (priceOrder.isAsc) {
      params['price_order'] = priceOrder.name;
    }
    if (status.isNotEmpty) {
      params['status'] = status;
    }
    if (regions.isNotEmpty) {
      params['regions'] = regions;
    }
    if (districts.isNotEmpty) {
      params['districts'] = districts;
    }
    if (infrastructures.isNotEmpty) {
      params['infrastructures'] = infrastructures;
    }
    if (priceFrom > 0) {
      params['price_from'] = priceFrom;
    }
    if (priceTo > 0) {
      params['price_to'] = priceTo;
    }
    if (currency.isNotEmpty) {
      params['currency'] = currency;
    }
    if (sort.isNotEmpty) {
      params['sort'] = sort;
    }
    if (roomCount > 0) {
      params['room_count'] = roomCount;
    }
    if (floorCount > 0) {
      params['floor_count'] = floorCount;
    }
    if (floor > 0) {
      params['floor'] = floor;
    }
    if (homeDetails.isNotEmpty) {
      params['home_details'] = homeDetails;
    }
    if (buildingMaterials.isNotEmpty) {
      params['building_materials'] = buildingMaterials;
    }
    if (priceOptions.isNotEmpty) {
      params['price_options'] = priceOptions;
    }
    if (latitude != 0.0) {
      params['latitude'] = latitude;
    }
    if (longitude != 0.0) {
      params['longitude'] = longitude;
    }
    if (radius > 0) {
      params['radius'] = radius;
    }
    if (page > 0) {
      params['page'] = page;
    }
    if (perPage > 0) {
      params['per_page'] = perPage;
    }

    if (count) {
      params['count'] = count;
    }
    return params;
  }

  Map<String, dynamic> toQueryParams() {
    final queryParams = <String, dynamic>{};

    void add(String key, dynamic value) {
      if (value == null) return;
      if (value is String && value.isEmpty) return;
      if (value is num && value == 0) return;
      queryParams[key] = value;
    }

    void addList(String key, List list) {
      if (list.isEmpty) return;
      for (int i = 0; i < list.length; i++) {
        final value = list[i];
        if (value != null && (!(value is String) || value.isNotEmpty)) {
          queryParams['$key[$i]'] = value;
        }
      }
    }

    // Scalar fields
    add('type', type);
    add('service_id', serviceId);
    add('user_id', userId);
    add('order', order.name);
    add('price_order', priceOrder.name);
    add('status', status);
    add('price_from', priceFrom);
    add('price_to', priceTo);
    add('currency', currency);
    add('sort', sort);
    add('room_count', roomCount);
    add('floor_count', floorCount);
    add('floor', floor);
    add('latitude', latitude);
    add('longitude', longitude);
    add('radius', radius);
    add('page', page);
    add('per_page', perPage);
    add('count', count);

    // List fields
    addList('category_ids', categoryIds);
    addList('regions', regions);
    addList('districts', districts);
    addList('infrastructures', infrastructures);
    addList('home_details', homeDetails);
    addList('building_materials', buildingMaterials);
    addList('price_options', priceOptions);

    return queryParams;
  }
}
