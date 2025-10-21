part of 'saved_bloc.dart';

class SavedState extends Equatable {
  final FormzSubmissionStatus status;
  final List<EstateAnnouncementCardEntity> savedAnnouncementsList;

  const SavedState({
    this.status = FormzSubmissionStatus.initial,
    this.savedAnnouncementsList = const [],
  });

  @override
  List<Object?> get props => [status, savedAnnouncementsList];

  SavedState copyWith({
    FormzSubmissionStatus? status,
    List<EstateAnnouncementCardEntity>? savedAnnouncementsList,
  }) {
    return SavedState(
      status: status ?? this.status,
      savedAnnouncementsList: savedAnnouncementsList ?? this.savedAnnouncementsList,
    );
  }
}
