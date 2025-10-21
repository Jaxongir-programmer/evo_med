part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfileGetEvent extends ProfileEvent {}

class ClearInfoEvent extends ProfileEvent {}

class UpdateUserActivityEvent extends ProfileEvent {}


class UpdateDeviceLastActivityEvent extends ProfileEvent {}
