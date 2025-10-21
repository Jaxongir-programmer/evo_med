import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/address_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/category_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/estate_announcement_card_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/images_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/location_point_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/media_item_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/price_entity.dart';
import 'package:evo_med/features/on_boarding/data/models/names_model.dart';

part 'estate_announcement_card_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class EstateAnnouncementCardModel {
  final int id;
  final String slug;
  final int userId;
  final int categoryId;
  final int serviceId;
  final PriceModel price;
  final String currency;
  final List<MediaItemModel> images;
  final List<MediaItemModel> videos;
  final AddressModel address;
  final LocationPointModel location;
  final double area;
  final double landArea;
  final int views;
  final String status;
  final NamesModel statusName;
  final List<String> surroundingObjects;
  final List<String> priceOptions;
  final List<String> details;
  final List<String> infrastructures;
  final List<String> additionalFacility;
  final String planningImage;
  final int floorCount;
  final int floor;
  final int roomCount;
  final int gateCount;
  final String bussinessType;
  final List<String> buildingMaterials;
  final List<String> buildingStyle;
  final List<String> homeDetails;
  final List<String> homePlan;
  final List<String> equipment;
  final bool isFavorite;
  final CategoryModel category;

  const EstateAnnouncementCardModel({
    this.id = 0,
    this.slug = '',
    this.userId = 0,
    this.categoryId = 0,
    this.serviceId = 0,
    this.price = const PriceModel(),
    this.currency = '',
    this.images = const [],
    this.videos = const [],
    this.address = const AddressModel(),
    this.location = const LocationPointModel(),
    this.area = 0.0,
    this.landArea = 0.0,
    this.views = 0,
    this.status = '',
    this.statusName = const NamesModel(),
    this.surroundingObjects = const [],
    this.priceOptions = const [],
    this.details = const [],
    this.infrastructures = const [],
    this.additionalFacility = const [],
    this.planningImage = '',
    this.floorCount = 0,
    this.floor = 0,
    this.roomCount = 0,
    this.gateCount = 0,
    this.bussinessType = '',
    this.buildingMaterials = const [],
    this.buildingStyle = const [],
    this.homeDetails = const [],
    this.homePlan = const [],
    this.equipment = const [],
    this.isFavorite = false,
    this.category = const CategoryModel(),
  });

  factory EstateAnnouncementCardModel.fromJson(Map<String, dynamic> json) =>
      _$EstateAnnouncementCardModelFromJson(json);

  EstateAnnouncementCardEntity toEntity() {
    return EstateAnnouncementCardEntity(
      id: id,
      slug: slug,
      userId: userId,
      categoryId: categoryId,
      serviceId: serviceId,
      price: price.toEntity(),
      currency: currency,
      images: images.map((e) => e.toEntity()).toList(),
      videos: videos.map((e) => e.toEntity()).toList(),
      address: address.toEntity(),
      location: location.toEntity(),
      area: area,
      landArea: landArea,
      views: views,
      status: status,
      statusName: statusName.toEntity(),
      surroundingObjects: surroundingObjects,
      priceOptions: priceOptions,
      details: details,
      infrastructures: infrastructures,
      additionalFacility: additionalFacility,
      planningImage: planningImage,
      floorCount: floorCount,
      floor: floor,
      roomCount: roomCount,
      gateCount: gateCount,
      bussinessType: bussinessType,
      buildingMaterials: buildingMaterials,
      buildingStyle: buildingStyle,
      homeDetails: homeDetails,
      homePlan: homePlan,
      equipment: equipment,
      isFavorite: isFavorite,
      category: category.toEntity(),
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class PriceModel {
  final int uzs;
  final int usd;

  const PriceModel({
    this.uzs = 0,
    this.usd = 0,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);

  PriceEntity toEntity() {
    return PriceEntity(
      uzs: uzs,
      usd: usd,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class MediaItemModel {
  final String url;
  final String title;
  final String subtype;

  const MediaItemModel({
    this.url = '',
    this.title = '',
    this.subtype = '',
  });

  factory MediaItemModel.fromJson(Map<String, dynamic> json) => _$MediaItemModelFromJson(json);

  MediaItemEntity toEntity() {
    return MediaItemEntity(
      url: url,
      title: title,
      subtype: subtype,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class LocationPointModel {
  final double longitude;
  final double latitude;

  const LocationPointModel({
    this.longitude = 0.0,
    this.latitude = 0.0,
  });

  factory LocationPointModel.fromJson(Map<String, dynamic> json) => _$LocationPointModelFromJson(json);

  LocationPointEntity toEntity() {
    return LocationPointEntity(
      longitude: longitude,
      latitude: latitude,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class ImagesModel {
  final List<MediaItemModel> main;
  final List<MediaItemModel> mainRooms;
  final List<MediaItemModel> other;

  const ImagesModel({
    this.main = const [],
    this.mainRooms = const [],
    this.other = const [],
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) => _$ImagesModelFromJson(json);

  ImagesEntity toEntity() {
    return ImagesEntity(
      main: main.map((e) => e.toEntity()).toList(),
      mainRooms: mainRooms.map((e) => e.toEntity()).toList(),
      other: other.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class AddressModel {
  final String region;
  final String district;
  final String street;
  final String home;

  const AddressModel({
    this.region = '',
    this.district = '',
    this.street = '',
    this.home = '',
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

  AddressEntity toEntity() {
    return AddressEntity(
      region: region,
      district: district,
      street: street,
      home: home,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class CategoryModel {
  final int id;
  final NamesModel title;

  const CategoryModel({
    this.id = 0,
    this.title = const NamesModel(),
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      title: title.toEntity(),
    );
  }
}
