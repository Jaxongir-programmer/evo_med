part of 'on_boarding_bloc.dart';

class OnBoardingState extends Equatable {
  final FormzSubmissionStatus status;
  final List<OnBoardingEntity> onBoardingList;

  const OnBoardingState({
    this.status = FormzSubmissionStatus.initial,
    this.onBoardingList = const [],
  });

  @override
  List<Object?> get props => [
        status,
        onBoardingList,
      ];

  OnBoardingState copyWith({
    FormzSubmissionStatus? status,
    List<OnBoardingEntity>? onBoardingList,
  }) {
    return OnBoardingState(
      status: status ?? this.status,
      onBoardingList: onBoardingList ?? this.onBoardingList,
    );
  }
}
