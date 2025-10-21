import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart'; 
import 'package:evo_med/features/add_announcement/domain/entities/add_announcement_entity.dart';
import 'package:evo_med/features/add_announcement/domain/use_cases/add_announcement_usecase.dart';

part 'add_announcement_event.dart';
part 'add_announcement_state.dart';

class AddAnnouncementBloc extends Bloc<AddAnnouncementEvent, AddAnnouncementState> {
  final AddAnnouncementUseCase addAnnouncementUseCase;
        
  AddAnnouncementBloc({required this.addAnnouncementUseCase}) : super(const AddAnnouncementState()) {
    on<AddAnnouncementGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await addAnnouncementUseCase('');
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          addAnnouncement: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}
    