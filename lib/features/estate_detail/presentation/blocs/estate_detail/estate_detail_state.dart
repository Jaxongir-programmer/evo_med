part of 'estate_detail_bloc.dart';

class EstateDetailState extends Equatable {
  final FormzSubmissionStatus status;
  final EstateDetailEntity estateDetail;
  const EstateDetailState({
    this.status = FormzSubmissionStatus.initial,
    this.estateDetail = const EstateDetailEntity(),
    
  });
  @override
  List<Object?> get props => [status, estateDetail];

  EstateDetailState copyWith({
    FormzSubmissionStatus? status,
    EstateDetailEntity? estateDetail,
  }) {
    return EstateDetailState(
      status: status ?? this.status,
      estateDetail: estateDetail ?? this.estateDetail,
    );
  }
}

    