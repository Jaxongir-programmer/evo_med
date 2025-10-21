// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      balance: (json['balance'] as num?)?.toInt() ?? 0,
      lang: json['lang'] as String? ?? "",
      role: json['role'] as String? ?? "",
      realEstates: json['real_estates'] as String? ?? "",
      realEstateAnnouncements:
          json['real_estate_announcements'] as String? ?? "",
      userCars: json['user_cars'] as String? ?? "",
      userCarAnnouncements: json['user_car_announcements'] as String? ?? "",
      services: json['services'] as String? ?? "",
      userTransactions: json['user_transactions'] as String? ?? "",
      identification: json['identification'] as String? ?? "",
      isIdentified: json['is_identified'] as bool? ?? false,
      bonus: json['bonus'] == null
          ? const BonusModel()
          : BonusModel.fromJson(json['bonus'] as Map<String, dynamic>),
    );
