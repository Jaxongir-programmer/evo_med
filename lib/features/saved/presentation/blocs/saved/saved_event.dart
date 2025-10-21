part of 'saved_bloc.dart';

abstract class SavedEvent {}

class GetSavedEvent extends SavedEvent {}

class AddAnnounceToSavedEvent extends SavedEvent {
  final int announcementId;

  AddAnnounceToSavedEvent({
    required this.announcementId,
  });
}

class DeleteAnnounceFromSavedEvent extends SavedEvent {
  final int announcementId;

  DeleteAnnounceFromSavedEvent({
    required this.announcementId,
  });
}

class UpdateAnnounceEvent extends SavedEvent {
  final int announcementId;

  UpdateAnnounceEvent({
    required this.announcementId,
  });
}
