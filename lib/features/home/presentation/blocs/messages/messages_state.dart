part of 'messages_bloc.dart';

class MessagesState extends Equatable {
  final List<MessageEntity> messages;
  final FormzSubmissionStatus status;

  const MessagesState({
    this.messages = const [],
    this.status = FormzSubmissionStatus.initial,
  });

  MessagesState copyWith({
    List<MessageEntity>? messages,
    FormzSubmissionStatus? status,
  }) {
    return MessagesState(
      messages: messages ?? this.messages,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        messages,
        status,
      ];
}
