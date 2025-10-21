part of 'packages_bloc.dart';

final class PackagesState extends Equatable {
  final List<TariffEntity> viewTariffs;
  final List<TariffEntity> topTariffs;
  final List<TariffEntity> postTariffs;
  final FormzSubmissionStatus status;
  final List<UserTariffEntity> userTariffs;

  const PackagesState({
    this.viewTariffs = const [],
    this.topTariffs = const [],
    this.postTariffs = const [],
    this.status = FormzSubmissionStatus.initial,
    this.userTariffs = const [],
  });

  PackagesState copyWith({
    List<TariffEntity>? viewTariffs,
    List<TariffEntity>? topTariffs,
    List<TariffEntity>? postTariffs,
    FormzSubmissionStatus? status,
    List<UserTariffEntity>? userTariffs,
  }) {
    return PackagesState(
      viewTariffs: viewTariffs ?? this.viewTariffs,
      topTariffs: topTariffs ?? this.topTariffs,
      postTariffs: postTariffs ?? this.postTariffs,
      status: status ?? this.status,
      userTariffs: userTariffs ?? this.userTariffs,
    );
  }

  @override
  List<Object> get props => [
        viewTariffs,
        topTariffs,
        postTariffs,
        status,
        userTariffs,
      ];
}
