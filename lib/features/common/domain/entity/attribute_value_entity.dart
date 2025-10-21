import 'package:equatable/equatable.dart';
import 'package:evo_med/features/on_boarding/domain/entities/names_entity.dart';

class AttributeValueEntity extends Equatable {
  final int id;
  final NamesEntity title;

  const AttributeValueEntity({
    this.id = 0,
    this.title = const NamesEntity(),
  });

  @override
  List<Object?> get props => [
        id,
        title,
      ];
}
