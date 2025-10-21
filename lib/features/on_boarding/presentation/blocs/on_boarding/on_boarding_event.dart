part of 'on_boarding_bloc.dart'; 

abstract class OnBoardingEvent {}

class OnBoardingGetEvent extends OnBoardingEvent {}

class CreateDeviceEvent extends OnBoardingEvent {
  final String language;

  CreateDeviceEvent({required this.language});
}
