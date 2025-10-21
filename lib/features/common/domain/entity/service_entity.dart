import 'package:equatable/equatable.dart';
import 'package:evo_med/features/on_boarding/domain/entities/names_entity.dart';

class ServiceEntity extends Equatable {
  final int id;
  final NamesEntity title;
  final String image;
  final NamesEntity description;
  final int price;
  final bool isMain;

  const ServiceEntity({
    this.id = 0,
    this.title = const NamesEntity(),
    this.image = '',
    this.description = const NamesEntity(),
    this.price = 0,
    this.isMain = false,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        description,
        price,
        isMain,
      ];
}
