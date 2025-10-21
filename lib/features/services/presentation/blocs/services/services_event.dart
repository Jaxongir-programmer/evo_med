part of 'services_bloc.dart'; 

abstract class ServicesEvent {}

class ServicesGetEvent extends ServicesEvent {
  final int id;
  ServicesGetEvent({
    required this.id,
  });
}
    