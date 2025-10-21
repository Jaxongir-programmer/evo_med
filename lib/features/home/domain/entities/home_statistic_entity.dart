import 'package:equatable/equatable.dart';

class HomeStatisticEntity extends Equatable {
  final StatusEntity estate;
  final StatusEntity car;

  const HomeStatisticEntity({
    this.estate = const StatusEntity(),
    this.car = const StatusEntity(),
  });

  @override
  List<Object?> get props => [
        estate,
        car,
      ];
}

class StatusEntity extends Equatable {
  final int category_id;
  final StateEntity rent;
  final StateEntity sale;

  const StatusEntity({
    this.category_id = 0,
    this.rent = const StateEntity(),
    this.sale = const StateEntity(),
  });

  @override
  List<Object?> get props => [
        category_id,
        rent,
        sale,
      ];
}

class StateEntity extends Equatable {
  final int service_id;
  final int count;
  final bool isActive;

  const StateEntity({
    this.service_id = 0,
    this.count = 0,
    this.isActive = false,
  });

  @override
  List<Object?> get props => [
        service_id,
        count,
        isActive,
      ];
}
