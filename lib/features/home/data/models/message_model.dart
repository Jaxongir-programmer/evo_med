import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/home/domain/entities/message_entity.dart';

part 'message_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class MessageModel {
  final int id;
  final String title;
  final String image;
  final String body;
  final bool isPublished;
  final String createdAt;

  const MessageModel({
    this.id = 0,
    this.title = '',
    this.image = '',
    this.body = '',
    this.isPublished = false,
    this.createdAt = '',
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      title: title,
      image: image,
      body: body,
      isPublished: isPublished,
      createdAt: createdAt,
    );
  }
}
