import 'package:equatable/equatable.dart';

class PriceEntity extends Equatable {
  final int uzs;
  final int usd;

  const PriceEntity({
    this.uzs = 0,
    this.usd = 0,
  });

  @override
  List<Object?> get props => [uzs, usd];
}
