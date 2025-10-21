import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/home/domain/entities/home_statistic_entity.dart';

part 'home_statistic_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class HomeStatisticModel {
  final StatusModel estate;
  final StatusModel car;

  HomeStatisticModel({
    this.estate = const StatusModel(),
    this.car = const StatusModel(),
  });

  factory HomeStatisticModel.fromJson(Map<String, dynamic> json) => _$HomeStatisticModelFromJson(json);

  HomeStatisticEntity toEntity() {
    return HomeStatisticEntity(
      estate: estate.toEntity(),
      car: car.toEntity(),
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class StatusModel {
  final int category_id;
  final StateModel rent;
  final StateModel sale;

  const StatusModel({
    this.category_id = 0,
    this.rent = const StateModel(),
    this.sale = const StateModel(),
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) => _$StatusModelFromJson(json);

  StatusEntity toEntity() {
    return StatusEntity(
      category_id: category_id,
      rent: rent.toEntity(),
      sale: sale.toEntity(),
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class StateModel {
  final int service_id;
  final int count;
  final bool isActive;

  const StateModel({
    this.service_id = 0,
    this.count = 0,
    this.isActive = false,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => _$StateModelFromJson(json);

  StateEntity toEntity() {
    return StateEntity(
      service_id: service_id,
      isActive: isActive,
      count: count,
    );
  }
}
