import 'package:equatable/equatable.dart';
import 'package:evo_med/features/on_boarding/domain/entities/names_entity.dart';


class LocationEntity extends Equatable {
  final int id;
  final NamesEntity title;
  final String code;
  final bool isActive;
  final int parentId;

  const LocationEntity({
    this.id = 0,
    this.title = const NamesEntity(),
    this.code = '',
    this.isActive = false,
    this.parentId = 0,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        code,
        isActive,
        parentId,
      ];
}

extension LocationEntityCopy on LocationEntity {
  LocationEntity copyWith({
    int? id,
    NamesEntity? title,
    String? code,
    bool? isActive,
    int? parentId,
  }) {
    return LocationEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
      isActive: isActive ?? this.isActive,
      parentId: parentId ?? this.parentId,
    );
  }
}
