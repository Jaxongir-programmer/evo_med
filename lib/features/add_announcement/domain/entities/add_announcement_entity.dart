import 'package:equatable/equatable.dart';

class AddAnnouncementEntity extends Equatable {
  final int id;
  final String name;

  const AddAnnouncementEntity({
    this.id = -1,
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,name,
      ];
}
    