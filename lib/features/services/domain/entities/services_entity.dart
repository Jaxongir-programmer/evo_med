import 'package:equatable/equatable.dart';

class ServicesEntity extends Equatable {
  final int id;
  final String name;

  const ServicesEntity({
    this.id = -1,
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,name,
      ];
}
    