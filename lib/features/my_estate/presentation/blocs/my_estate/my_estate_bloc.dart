import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/util/params/my_estate_params.dart';
import 'package:evo_med/features/my_estate/domain/entities/init_identification_entity.dart';
import 'package:evo_med/features/my_estate/domain/entities/user_car_entity.dart';
import 'package:evo_med/features/my_estate/domain/entities/user_real_estate_entity.dart';
import 'package:evo_med/features/my_estate/domain/use_cases/get_user_car_usecase.dart';
import 'package:evo_med/features/my_estate/domain/use_cases/get_user_real_estate_usecase.dart';
import 'package:evo_med/features/my_estate/domain/use_cases/identify_usecase.dart';
import 'package:evo_med/features/my_estate/domain/use_cases/init_identification_usecase.dart';

part 'my_estate_event.dart';

part 'my_estate_state.dart';

class MyEstateBloc extends Bloc<MyEstateEvent, MyEstateState> {
  final InitIdentificationUseCase myEstateUseCase;
  final IdentifyUsecase identifyUsecase;
  final GetUserRealEstateUseCase getUserRealEstateListUseCase;
  final GetUserCarUseCase getUserCarUseCase;

  MyEstateBloc({
    required this.myEstateUseCase,
    required this.identifyUsecase,
    required this.getUserRealEstateListUseCase,
    required this.getUserCarUseCase,
  }) : super(const MyEstateState()) {
    on<GetUserRealEstateListEvent>((event, emit) async {
      emit(state.copyWith(realEstateStatus: FormzSubmissionStatus.inProgress));
      final result = await getUserRealEstateListUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          realEstateStatus: FormzSubmissionStatus.success,
          realEstateList: result.right,
        ));
      } else {
        emit(state.copyWith(
          realEstateStatus: FormzSubmissionStatus.failure,
        ));
      }
    });
    on<GetUserCarListEvent>((event, emit) {
      emit(state.copyWith(userCarStatus: FormzSubmissionStatus.inProgress));
      getUserCarUseCase.call(NoParams()).then((result) {
        if (result.isRight) {
          emit(state.copyWith(
            userCarStatus: FormzSubmissionStatus.success,
            userCarList: result.right,
          ));
        } else {
          emit(state.copyWith(
            userCarStatus: FormzSubmissionStatus.failure,
          ));
        }
      });
    });
    on<InitIdentificationEvent>((event, emit) async {
      emit(state.copyWith(identificationStatus: FormzSubmissionStatus.inProgress));
      final result = await myEstateUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          identificationStatus: FormzSubmissionStatus.success,
          initIdentificationEntity: result.right,
        ));
      } else {
        emit(state.copyWith(
          identificationStatus: FormzSubmissionStatus.failure,
        ));
      }
    });
    on<IdentifyEvent>((event, emit) async {
      emit(state.copyWith(identificationStatus: FormzSubmissionStatus.inProgress));
      final result = await identifyUsecase
          .call(IdentificationParams(code: event.code, requestId: state.initIdentificationEntity.requestId));
      if (result.isRight) {
        emit(state.copyWith(
          identificationStatus: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(
          identificationStatus: FormzSubmissionStatus.failure,
        ));
      }
    });
  }
}
