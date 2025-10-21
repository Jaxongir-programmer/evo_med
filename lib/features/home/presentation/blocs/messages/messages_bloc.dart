import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/features/home/domain/entities/message_entity.dart';
import 'package:evo_med/features/home/domain/use_cases/get_messages_usecase.dart';

part 'messages_event.dart';

part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final GetMessagesUseCase getMessagesUseCase;

  MessagesBloc({
    required this.getMessagesUseCase,
  }) : super(MessagesState()) {
    on<GetMessagesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await getMessagesUseCase(NoParams());
      if (result.isRight) {
        emit(state.copyWith(status: FormzSubmissionStatus.success, messages: result.right));
      } else {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
        ));
      }
    });
  }
}
