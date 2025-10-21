part of 'add_announcement_bloc.dart'; 

abstract class AddAnnouncementEvent {}

class AddAnnouncementGetEvent extends AddAnnouncementEvent {
  final int id;
  AddAnnouncementGetEvent({
    required this.id,
  });
}
    