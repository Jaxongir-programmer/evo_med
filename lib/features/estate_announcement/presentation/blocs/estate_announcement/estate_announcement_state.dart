part of 'estate_announcement_bloc.dart';

class EstateAnnouncementState extends Equatable {
  final FormzSubmissionStatus realEstateStatus;
  final List<EstateAnnouncementCardEntity> realEstateAnnouncementList;
  final int realEstatePage;
  final int filterResultCount;

  const EstateAnnouncementState({
    this.realEstateStatus = FormzSubmissionStatus.initial,
    this.realEstateAnnouncementList = const [],
    this.realEstatePage = 0,
    this.filterResultCount = 0,
  });

  @override
  List<Object?> get props => [
        realEstateStatus,
        realEstateAnnouncementList,
        realEstatePage,
        filterResultCount,
      ];

  EstateAnnouncementState copyWith({
    FormzSubmissionStatus? realEstateStatus,
    List<EstateAnnouncementCardEntity>? realEstateAnnouncementList,
    int? realEstatePage,
    int? filterResultCount,
  }) {
    return EstateAnnouncementState(
      realEstateStatus: realEstateStatus ?? this.realEstateStatus,
      realEstateAnnouncementList: realEstateAnnouncementList ?? this.realEstateAnnouncementList,
      realEstatePage: realEstatePage ?? this.realEstatePage,
      filterResultCount: filterResultCount ?? this.filterResultCount,
    );
  }
}
