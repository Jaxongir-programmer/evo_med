import 'package:equatable/equatable.dart';

class TariffEntity extends Equatable {
  final int id;
  final String title;
  final int limit;
  final int price;
  final int sale;
  final String billingCycle;
  final String type;
  final bool isActive;
  final String expiresAt;

  const TariffEntity({
    this.id = 0,
    this.title = '',
    this.limit = 0,
    this.price = 0,
    this.sale = 0,
    this.billingCycle = '',
    this.type = '',
    this.isActive = false,
    this.expiresAt = '',
  });

  @override
  List<Object?> get props => [
        id,
        title,
        limit,
        price,
        sale,
    type,
        billingCycle,
        isActive,
        expiresAt,
      ];
}
