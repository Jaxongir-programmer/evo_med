import 'package:equatable/equatable.dart';

class EstateDetailEntity extends Equatable {
  final int id;
  final String name;

  const EstateDetailEntity({
    this.id = -1,
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,name,
      ];
}
    