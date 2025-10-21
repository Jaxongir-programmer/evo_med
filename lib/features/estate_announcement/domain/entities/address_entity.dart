import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String region;
  final String district;
  final String street;
  final String home;

  const AddressEntity({
    this.region = '',
    this.district = '',
    this.street = '',
    this.home = '',
  });

  get fullAddress {
    return '$region, $district, $street, $home';
  }

  @override
  List<Object?> get props => [region, district, street, home];
}
