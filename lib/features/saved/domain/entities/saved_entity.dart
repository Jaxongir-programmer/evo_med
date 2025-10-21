import 'package:equatable/equatable.dart';

class SavedEntity extends Equatable {
  final int id;
  final String name;

  const SavedEntity({
    this.id = -1,
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,name,
      ];
}
    