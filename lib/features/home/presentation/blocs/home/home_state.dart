part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus getHomeServiceInfoStatus;
  final HomeStatisticEntity homeStatisticEntity;

  const HomeState({
    this.getHomeServiceInfoStatus = FormzSubmissionStatus.initial,
    this.homeStatisticEntity = const HomeStatisticEntity(),
  });

  @override
  List<Object?> get props => [
        getHomeServiceInfoStatus,
        homeStatisticEntity,
      ];

  HomeState copyWith({
    FormzSubmissionStatus? getHomeServiceInfoStatus,
    HomeStatisticEntity? homeStatisticEntity,
  }) {
    return HomeState(
      getHomeServiceInfoStatus: getHomeServiceInfoStatus ?? this.getHomeServiceInfoStatus,
      homeStatisticEntity: homeStatisticEntity ?? this.homeStatisticEntity,
    );
  }
}
