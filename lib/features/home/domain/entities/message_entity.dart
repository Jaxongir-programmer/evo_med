import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final int id;
  final String title;
  final String image;
  final String body;
  final bool isPublished;
  final String createdAt;

  String get formattedDate {
    final format = DateFormat("dd.MMMM.yyyy");
    try {
      final date = DateTime.parse(createdAt);
      return format.format(date);
    } catch (e) {
      return createdAt; // Return the original string if parsing fails
    }
  }

  const MessageEntity({
    this.id = 0,
    this.title = '',
    this.image = '',
    this.body = '',
    this.isPublished = false,
    this.createdAt = '',
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        body,
        isPublished,
        createdAt,
      ];
}
