// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_real_estate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRealEstateModel _$UserRealEstateModelFromJson(Map<String, dynamic> json) =>
    UserRealEstateModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      cadastreCode: json['cadastre_code'] as String? ?? '',
      title: json['title'] as String? ?? '',
      address: json['address'] == null
          ? const AddressModel()
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      invCost: (json['inv_cost'] as num?)?.toDouble() ?? 0.0,
      totalArea: (json['total_area'] as num?)?.toDouble() ?? 0.0,
      landArea: (json['land_area'] as num?)?.toDouble() ?? 0.0,
      extraLandArea: (json['extra_land_area'] as num?)?.toDouble() ?? 0.0,
      percentage: (json['percentage'] as num?)?.toInt() ?? 0,
      isActive: json['is_active'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? '',
    );

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      region: json['region'] as String? ?? '',
      district: json['district'] as String? ?? '',
      street: json['street'] as String? ?? '',
    );
