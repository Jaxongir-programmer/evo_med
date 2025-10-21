part of 'services_bloc.dart';

class ServicesState extends Equatable {
  final FormzSubmissionStatus status;
  final ServicesEntity services;
  const ServicesState({
    this.status = FormzSubmissionStatus.initial,
    this.services = const ServicesEntity(),
    
  });
  @override
  List<Object?> get props => [status, services];

  ServicesState copyWith({
    FormzSubmissionStatus? status,
    ServicesEntity? services,
  }) {
    return ServicesState(
      status: status ?? this.status,
      services: services ?? this.services,
    );
  }
}

    