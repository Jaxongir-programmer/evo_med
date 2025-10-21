import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/profile/data/models/bonus_model.dart';
import 'package:evo_med/features/profile/domain/entities/profile_entity.dart';

part 'profile_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class ProfileModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final int balance;
  final String lang;
  final String role;
  final String realEstates;
  final String realEstateAnnouncements;
  final String userCars;
  final String userCarAnnouncements;
  final String services;
  final String userTransactions;
  final String identification;
  final bool isIdentified;
  final BonusModel bonus;

  const ProfileModel({
    this.id = 0,
    this.firstName = "",
    this.lastName = "",
    this.phone = "",
    this.balance = 0,
    this.lang = "",
    this.role = "",
    this.realEstates = "",
    this.realEstateAnnouncements = "",
    this.userCars = "",
    this.userCarAnnouncements = "",
    this.services = "",
    this.userTransactions = "",
    this.identification = "",
    this.isIdentified = false,
    this.bonus = const BonusModel(),
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      balance: balance,
      lang: lang,
      role: role,
      realEstates: realEstates,
      realEstateAnnouncements: realEstateAnnouncements,
      userCars: userCars,
      userCarAnnouncements: userCarAnnouncements,
      services: services,
      userTransactions: userTransactions,
      identification: identification,
      isIdentified: isIdentified,
      bonus: bonus.toEntity(),
    );
  }
}
