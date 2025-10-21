// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentificationModel _$IdentificationModelFromJson(Map<String, dynamic> json) =>
    IdentificationModel(
      identifier: json['identifier'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      middleName: json['middle_name'] as String? ?? '',
      birthDate: json['birth_date'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      permanentAddress: json['permanent_address'] as String? ?? '',
    );
