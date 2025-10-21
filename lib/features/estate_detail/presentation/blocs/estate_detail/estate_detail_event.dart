part of 'estate_detail_bloc.dart'; 

abstract class EstateDetailEvent {}

class EstateDetailGetEvent extends EstateDetailEvent {
  final int id;
  EstateDetailGetEvent({
    required this.id,
  });
}
    