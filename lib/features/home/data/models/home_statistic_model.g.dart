// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeStatisticModel _$HomeStatisticModelFromJson(Map<String, dynamic> json) =>
    HomeStatisticModel(
      estate: json['estate'] == null
          ? const StatusModel()
          : StatusModel.fromJson(json['estate'] as Map<String, dynamic>),
      car: json['car'] == null
          ? const StatusModel()
          : StatusModel.fromJson(json['car'] as Map<String, dynamic>),
    );

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => StatusModel(
      category_id: (json['category_id'] as num?)?.toInt() ?? 0,
      rent: json['rent'] == null
          ? const StateModel()
          : StateModel.fromJson(json['rent'] as Map<String, dynamic>),
      sale: json['sale'] == null
          ? const StateModel()
          : StateModel.fromJson(json['sale'] as Map<String, dynamic>),
    );

StateModel _$StateModelFromJson(Map<String, dynamic> json) => StateModel(
      service_id: (json['service_id'] as num?)?.toInt() ?? 0,
      count: (json['count'] as num?)?.toInt() ?? 0,
      isActive: json['is_active'] as bool? ?? false,
    );
