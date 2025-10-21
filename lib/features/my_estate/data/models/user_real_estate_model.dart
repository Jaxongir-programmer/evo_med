import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/my_estate/domain/entities/user_real_estate_entity.dart';

part 'user_real_estate_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class UserRealEstateModel {
  final int id;
  final String cadastreCode;
  final String title;
  final AddressModel address;
  final double invCost;
  final double totalArea;
  final double landArea;
  final double extraLandArea;
  final int percentage;
  final bool isActive;
  final String createdAt;

  const UserRealEstateModel({
    this.id = 0,
    this.cadastreCode = '',
    this.title = '',
    this.address = const AddressModel(),
    this.invCost = 0.0,
    this.totalArea = 0.0,
    this.landArea = 0.0,
    this.extraLandArea = 0.0,
    this.percentage = 0,
    this.isActive = false,
    this.createdAt = '',
  });

  factory UserRealEstateModel.fromJson(Map<String, dynamic> json) => _$UserRealEstateModelFromJson(json);

  UserRealEstateEntity toEntity() {
    return UserRealEstateEntity(
      id: id,
      cadastreCode: cadastreCode,
      title: title,
      address: address.toEntity(),
      invCost: invCost,
      totalArea: totalArea,
      landArea: landArea,
      extraLandArea: extraLandArea,
      percentage: percentage,
      isActive: isActive,
      createdAt: createdAt,
    );
  }
}

@JsonSerializable(createToJson: false)
class AddressModel {
  final String region;
  final String district;
  final String street;

  const AddressModel({
    this.region = '',
    this.district = '',
    this.street = '',
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

  AddressEntity toEntity() {
    return AddressEntity(
      region: region,
      district: district,
      street: street,
    );
  }
}
