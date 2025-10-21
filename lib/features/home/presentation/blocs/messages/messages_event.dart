part of 'messages_bloc.dart';

@immutable
sealed class MessagesEvent {}

class GetMessagesEvent extends MessagesEvent {}
