import 'package:equatable/equatable.dart';

class MediaItemEntity extends Equatable {
  final String url;
  final String title;
  final String subtype;

  const MediaItemEntity({
    this.url = '',
    this.title = '',
    this.subtype = '',
  });

  @override
  List<Object?> get props => [url, title, subtype];
}
