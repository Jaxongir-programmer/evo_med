part of 'add_announcement_bloc.dart';

class AddAnnouncementState extends Equatable {
  final FormzSubmissionStatus status;
  final AddAnnouncementEntity addAnnouncement;
  const AddAnnouncementState({
    this.status = FormzSubmissionStatus.initial,
    this.addAnnouncement = const AddAnnouncementEntity(),
    
  });
  @override
  List<Object?> get props => [status, addAnnouncement];

  AddAnnouncementState copyWith({
    FormzSubmissionStatus? status,
    AddAnnouncementEntity? addAnnouncement,
  }) {
    return AddAnnouncementState(
      status: status ?? this.status,
      addAnnouncement: addAnnouncement ?? this.addAnnouncement,
    );
  }
}

    