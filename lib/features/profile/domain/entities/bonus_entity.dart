import 'package:equatable/equatable.dart';

class BonusEntity extends Equatable {
  final int view;
  final int post;

  const BonusEntity({
    this.view = 0,
    this.post = 0,
  });

  @override
  List<Object?> get props => [
        view,
        post,
      ];
}
