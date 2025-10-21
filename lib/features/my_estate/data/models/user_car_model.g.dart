// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCarModel _$UserCarModelFromJson(Map<String, dynamic> json) => UserCarModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      model: json['model'] as String? ?? '',
      color: json['color'] as String? ?? '',
      manufacturingYear: (json['manufacturing_year'] as num?)?.toInt() ?? 0,
      autoType: json['auto_type'] as String? ?? '',
      bodyNumber: json['body_number'] as String? ?? '',
      engineNumber: json['engine_number'] as String? ?? '',
      shassiNumber: json['shassi_number'] as String? ?? '',
      regNumber: json['reg_number'] as String? ?? '',
      regDate: json['reg_date'] as String? ?? '',
      division: json['division'] as String? ?? '',
      owner: json['owner'] as String? ?? '',
      ownerAddress: json['owner_address'] as String? ?? '',
    );
