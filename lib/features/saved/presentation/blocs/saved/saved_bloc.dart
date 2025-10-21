import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/params/saved_params.dart';
import 'package:evo_med/features/add_announcement/domain/entities/add_announcement_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/estate_announcement_card_entity.dart';
import 'package:evo_med/features/saved/domain/entities/saved_entity.dart';
import 'package:evo_med/features/saved/domain/use_cases/add_to_saved_usecase.dart';
import 'package:evo_med/features/saved/domain/use_cases/delete_saved_usecase.dart';
import 'package:evo_med/features/saved/domain/use_cases/get_saved_list_usecase.dart';
import 'package:evo_med/features/saved/domain/use_cases/update_saved_usecase.dart';

part 'saved_event.dart';

part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final AddToSavedUseCase addToSavedUseCase;
  final DeleteSavedUseCase deleteSavedUseCase;
  final UpdateSavedUseCase updateSavedUseCase;
  final GetSavedListUseCase savedUseCase;

  SavedBloc({
    required this.addToSavedUseCase,
    required this.deleteSavedUseCase,
    required this.updateSavedUseCase,
    required this.savedUseCase,
  }) : super(const SavedState()) {
    on<GetSavedEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await savedUseCase(SavedParams(type: AnnouncementType.estate));
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          savedAnnouncementsList: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
    on<AddAnnounceToSavedEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await addToSavedUseCase(SavedParams(announcementId: event.announcementId));
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          savedAnnouncementsList: [...state.savedAnnouncementsList, result.right],
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
    on<DeleteAnnounceFromSavedEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await deleteSavedUseCase(SavedParams(announcementId: event.announcementId));
      if (result.isRight) {
        state.savedAnnouncementsList.removeWhere((element) => element.id == event.announcementId);

        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          savedAnnouncementsList: state.savedAnnouncementsList,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}
