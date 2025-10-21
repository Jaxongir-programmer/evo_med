import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:evo_med/features/profile/domain/entities/tariff_entity.dart';

class UserTariffEntity extends Equatable {
  final int id;
  final TariffEntity tariff;
  final int used;
  final int dailyUsed;
  final int limit;
  final String startedAt;
  final String expiresAt;

  const UserTariffEntity({
    this.id = 0,
    this.tariff = const TariffEntity(),
    this.used = 0,
    this.dailyUsed = 0,
    this.limit = 0,
    this.startedAt = '',
    this.expiresAt = '',
  });

  int get remaining => limit - used;

  String get validityDate {
    final startDate = DateTime.parse(startedAt);
    final endDate = DateTime.parse(expiresAt);
    final dateFormat = DateFormat('dd.MM.yyyy');
    return '${dateFormat.format(startDate)} - ${dateFormat.format(endDate)}';
  }

  @override
  List<Object?> get props => [
        id,
        tariff,
        used,
        dailyUsed,
        limit,
        startedAt,
        expiresAt,
      ];
}
