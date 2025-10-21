import 'package:equatable/equatable.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/media_item_entity.dart';

class ImagesEntity extends Equatable {
  final List<MediaItemEntity> main;
  final List<MediaItemEntity> mainRooms;
  final List<MediaItemEntity> other;

  const ImagesEntity({
    this.main = const [],
    this.mainRooms = const [],
    this.other = const [],
  });

  @override
  List<Object?> get props => [main, mainRooms, other];
}
