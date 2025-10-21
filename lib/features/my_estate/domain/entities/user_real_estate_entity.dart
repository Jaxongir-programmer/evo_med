import 'package:equatable/equatable.dart';

class UserRealEstateEntity extends Equatable {
  final int id;
  final String cadastreCode;
  final String title;
  final AddressEntity address;
  final double invCost;
  final double totalArea;
  final double landArea;
  final double extraLandArea;
  final int percentage;
  final bool isActive;
  final String createdAt;

  const UserRealEstateEntity({
    this.id = 0,
    this.cadastreCode = '',
    this.title = '',
    this.address = const AddressEntity(),
    this.invCost = 0.0,
    this.totalArea = 0.0,
    this.landArea = 0.0,
    this.extraLandArea = 0.0,
    this.percentage = 0,
    this.isActive = false,
    this.createdAt = '',
  });

  @override
  List<Object?> get props => [
        id,
        cadastreCode,
        title,
        address,
        invCost,
        totalArea,
        landArea,
        extraLandArea,
        percentage,
        isActive,
        createdAt,
      ];
}

class AddressEntity extends Equatable {
  final String region;
  final String district;
  final String street;

  const AddressEntity({
    this.region = '',
    this.district = '',
    this.street = '',
  });

  @override
  List<Object?> get props => [
        region,
        district,
        street,
      ];
}
