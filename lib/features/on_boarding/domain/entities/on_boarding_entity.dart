import 'package:equatable/equatable.dart';
import 'package:evo_med/features/on_boarding/domain/entities/names_entity.dart';

class OnBoardingEntity extends Equatable {
  final int id;
  final NamesEntity title;
  final String image;
  final NamesEntity description;
  final int order;
  final bool isActive;

  const OnBoardingEntity({
    this.id = 0,
    this.title = const NamesEntity(),
    this.image = "",
    this.description = const NamesEntity(),
    this.order = 0,
    this.isActive = false,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        description,
        order,
        isActive,
      ];
}
