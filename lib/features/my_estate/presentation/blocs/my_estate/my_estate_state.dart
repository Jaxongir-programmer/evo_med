part of 'my_estate_bloc.dart';

class MyEstateState extends Equatable {
  final FormzSubmissionStatus realEstateStatus;
  final FormzSubmissionStatus userCarStatus;
  final FormzSubmissionStatus identificationStatus;
  final List<UserRealEstateEntity> realEstateList;
  final List<UserCarEntity> userCarList;
  final InitIdentificationEntity initIdentificationEntity;

  const MyEstateState({
    this.realEstateStatus = FormzSubmissionStatus.initial,
    this.userCarStatus = FormzSubmissionStatus.initial,
    this.identificationStatus = FormzSubmissionStatus.initial,
    this.realEstateList = const [],
    this.userCarList = const [],
    this.initIdentificationEntity = const InitIdentificationEntity(),
  });

  @override
  List<Object?> get props => [
        realEstateStatus,
        userCarStatus,
        identificationStatus,
        realEstateList,
        userCarList,
        initIdentificationEntity,
      ];

  MyEstateState copyWith({
    FormzSubmissionStatus? realEstateStatus,
    FormzSubmissionStatus? userCarStatus,
    FormzSubmissionStatus? identificationStatus,
    List<UserRealEstateEntity>? realEstateList,
    List<UserCarEntity>? userCarList,
    InitIdentificationEntity? initIdentificationEntity,
  }) {
    return MyEstateState(
      realEstateStatus: realEstateStatus ?? this.realEstateStatus,
      userCarStatus: userCarStatus ?? this.userCarStatus,
      identificationStatus: identificationStatus ?? this.identificationStatus,
      realEstateList: realEstateList ?? this.realEstateList,
      userCarList: userCarList ?? this.userCarList,
      initIdentificationEntity: initIdentificationEntity ?? this.initIdentificationEntity,
    );
  }
}
