part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final FormzSubmissionStatus status;
  final ProfileEntity profile;

  const ProfileState({
    this.status = FormzSubmissionStatus.initial,
    this.profile = const ProfileEntity(),
  });

  @override
  List<Object?> get props => [
        status,
        profile,
      ];

  ProfileState copyWith({
    FormzSubmissionStatus? status,
    ProfileEntity? profile,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
    );
  }
}
