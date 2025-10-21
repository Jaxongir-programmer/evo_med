import 'package:equatable/equatable.dart';

class LocationPointEntity extends Equatable {
  final double longitude;
  final double latitude;

  const LocationPointEntity({
    this.longitude = 0.0,
    this.latitude = 0.0,
  });

  @override
  List<Object?> get props => [longitude, latitude];
}
