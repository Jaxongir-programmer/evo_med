import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:evo_med/core/util/params/real_estate_params.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/estate_announcement_card_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/use_cases/estate_announcement_usecase.dart';
import 'package:evo_med/features/estate_announcement/domain/use_cases/estate_announcement_count_usecase.dart';

import '../../../../../core/util/enums/enums.dart';

part 'estate_announcement_event.dart';

part 'estate_announcement_state.dart';
class EstateAnnouncementBloc extends Bloc<EstateAnnouncementEvent, EstateAnnouncementState> {
  final GetRealEstateAnnouncementUseCase estateAnnouncementUseCase;
  final GetRealEstateAnnouncementCountUseCase estateAnnouncementCountUseCase;

  EstateAnnouncementBloc({required this.estateAnnouncementUseCase, required this.estateAnnouncementCountUseCase})
      : super(const EstateAnnouncementState()) {
    on<GetRealEstateAnnouncementEvent>((event, emit) async {
      emit(state.copyWith(realEstateStatus: FormzSubmissionStatus.inProgress));
      final result = await estateAnnouncementUseCase(RealEstateParams(
        type: AnnouncementType.estate.name,
        serviceId: 2,
        categoryIds: event.selectedCategories,
        regions: event.selectedRegions,
        districts: event.selectedSubRegions,
        priceFrom: event.minPrice,
        priceTo: event.maxPrice,
        currency: event.currency,
      ));
      if (result.isRight) {
        emit(state.copyWith(
          realEstateStatus: FormzSubmissionStatus.success,
          realEstateAnnouncementList: result.right.result,
          realEstatePage: result.right.totalCount,
        ));
      } else {
        emit(state.copyWith(realEstateStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetRealEstateAnnouncementCountEvent>((event, emit) async {
      emit(state.copyWith(realEstateStatus: FormzSubmissionStatus.inProgress));
      final result = await estateAnnouncementCountUseCase(RealEstateParams(
        type: AnnouncementType.estate.name,
        serviceId: 2,
        categoryIds: event.selectedCategories,
        regions: event.selectedRegions,
        districts: event.selectedSubRegions,
        priceFrom: event.minPrice,
        priceTo: event.maxPrice,
        currency: event.currency,
        count: event.count,
      ));
      if (result.isRight) {
        emit(state.copyWith(
          realEstateStatus: FormzSubmissionStatus.success,
          filterResultCount: result.right,
        ));
      } else {
        emit(state.copyWith(realEstateStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
