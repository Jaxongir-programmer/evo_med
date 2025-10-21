// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_announcement_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstateAnnouncementCardModel _$EstateAnnouncementCardModelFromJson(
        Map<String, dynamic> json) =>
    EstateAnnouncementCardModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      slug: json['slug'] as String? ?? '',
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      categoryId: (json['category_id'] as num?)?.toInt() ?? 0,
      serviceId: (json['service_id'] as num?)?.toInt() ?? 0,
      price: json['price'] == null
          ? const PriceModel()
          : PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      currency: json['currency'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => MediaItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => MediaItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      address: json['address'] == null
          ? const AddressModel()
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      location: json['location'] == null
          ? const LocationPointModel()
          : LocationPointModel.fromJson(
              json['location'] as Map<String, dynamic>),
      area: (json['area'] as num?)?.toDouble() ?? 0.0,
      landArea: (json['land_area'] as num?)?.toDouble() ?? 0.0,
      views: (json['views'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? '',
      statusName: json['status_name'] == null
          ? const NamesModel()
          : NamesModel.fromJson(json['status_name'] as Map<String, dynamic>),
      surroundingObjects: (json['surrounding_objects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      priceOptions: (json['price_options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      details: (json['details'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      infrastructures: (json['infrastructures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      additionalFacility: (json['additional_facility'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      planningImage: json['planning_image'] as String? ?? '',
      floorCount: (json['floor_count'] as num?)?.toInt() ?? 0,
      floor: (json['floor'] as num?)?.toInt() ?? 0,
      roomCount: (json['room_count'] as num?)?.toInt() ?? 0,
      gateCount: (json['gate_count'] as num?)?.toInt() ?? 0,
      bussinessType: json['bussiness_type'] as String? ?? '',
      buildingMaterials: (json['building_materials'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      buildingStyle: (json['building_style'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      homeDetails: (json['home_details'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      homePlan: (json['home_plan'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      equipment: (json['equipment'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFavorite: json['is_favorite'] as bool? ?? false,
      category: json['category'] == null
          ? const CategoryModel()
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => PriceModel(
      uzs: (json['uzs'] as num?)?.toInt() ?? 0,
      usd: (json['usd'] as num?)?.toInt() ?? 0,
    );

MediaItemModel _$MediaItemModelFromJson(Map<String, dynamic> json) =>
    MediaItemModel(
      url: json['url'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtype: json['subtype'] as String? ?? '',
    );

LocationPointModel _$LocationPointModelFromJson(Map<String, dynamic> json) =>
    LocationPointModel(
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
    );

ImagesModel _$ImagesModelFromJson(Map<String, dynamic> json) => ImagesModel(
      main: (json['main'] as List<dynamic>?)
              ?.map((e) => MediaItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      mainRooms: (json['main_rooms'] as List<dynamic>?)
              ?.map((e) => MediaItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      other: (json['other'] as List<dynamic>?)
              ?.map((e) => MediaItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      region: json['region'] as String? ?? '',
      district: json['district'] as String? ?? '',
      street: json['street'] as String? ?? '',
      home: json['home'] as String? ?? '',
    );

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] == null
          ? const NamesModel()
          : NamesModel.fromJson(json['title'] as Map<String, dynamic>),
    );
