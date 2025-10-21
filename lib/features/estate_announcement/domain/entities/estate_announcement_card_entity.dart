import 'package:equatable/equatable.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/address_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/category_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/images_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/location_point_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/media_item_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/price_entity.dart';
import 'package:evo_med/features/on_boarding/domain/entities/names_entity.dart';

class EstateAnnouncementCardEntity extends Equatable {
  final int id;
  final String slug;
  final int userId;
  final int categoryId;
  final int serviceId;
  final PriceEntity price;
  final String currency;
  final List<MediaItemEntity> images;
  final List<MediaItemEntity> videos;
  final AddressEntity address;
  final LocationPointEntity location;
  final double area;
  final double landArea;
  final int views;
  final String status;
  final NamesEntity statusName;
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
  final CategoryEntity category;

  const EstateAnnouncementCardEntity({
    this.id = 0,
    this.slug = '',
    this.userId = 0,
    this.categoryId = 0,
    this.serviceId = 0,
    this.price = const PriceEntity(),
    this.currency = '',
    this.images = const [],
    this.videos = const [],
    this.address = const AddressEntity(),
    this.location = const LocationPointEntity(),
    this.area = 0.0,
    this.landArea = 0.0,
    this.views = 0,
    this.status = '',
    this.statusName = const NamesEntity(),
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
    this.category = const CategoryEntity(),
  });

  @override
  List<Object?> get props => [
        id,
        slug,
        userId,
        categoryId,
        serviceId,
        price,
        currency,
        images,
        videos,
        address,
        location,
        area,
        landArea,
        views,
        status,
        statusName,
        surroundingObjects,
        priceOptions,
        details,
        infrastructures,
        additionalFacility,
        planningImage,
        floorCount,
        floor,
        roomCount,
        gateCount,
        bussinessType,
        buildingMaterials,
        buildingStyle,
        homeDetails,
        homePlan,
        equipment,
        isFavorite,
        category,
      ];
}
