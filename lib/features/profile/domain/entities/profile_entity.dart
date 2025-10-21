import 'package:equatable/equatable.dart';
import 'package:evo_med/features/profile/domain/entities/bonus_entity.dart';

class ProfileEntity extends Equatable {
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
  final BonusEntity bonus;

  const ProfileEntity({
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
    this.bonus = const BonusEntity(),
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        phone,
        balance,
        lang,
        role,
        realEstates,
        realEstateAnnouncements,
        userCars,
        userCarAnnouncements,
        services,
        userTransactions,
        identification,
        isIdentified,
        bonus
      ];
}
