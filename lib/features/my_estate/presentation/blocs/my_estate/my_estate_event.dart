part of 'my_estate_bloc.dart';

abstract class MyEstateEvent {}

class GetUserRealEstateListEvent extends MyEstateEvent {}

class GetUserCarListEvent extends MyEstateEvent {}

class InitIdentificationEvent extends MyEstateEvent {}

class IdentifyEvent extends MyEstateEvent {
  final String code;

  IdentifyEvent({required this.code});
}
