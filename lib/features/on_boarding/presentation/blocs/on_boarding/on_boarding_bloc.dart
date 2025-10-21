import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/util/my_functions.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/on_boarding/domain/entities/on_boarding_entity.dart';
import 'package:evo_med/features/on_boarding/domain/use_cases/create_device_usecase.dart';
import 'package:evo_med/features/on_boarding/domain/use_cases/on_boarding_usecase.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final OnBoardingUseCase onBoardingUseCase;
  final CreateDeviceUseCase createDeviceUseCase;

  OnBoardingBloc({
    required this.onBoardingUseCase,
    required this.createDeviceUseCase,
  }) : super(const OnBoardingState()) {
    on<OnBoardingGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await onBoardingUseCase(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          onBoardingList: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
    on<CreateDeviceEvent>((event, emit) async {
      final deviceInfo = await MyFunctions.getDeviceInfo();
      await createDeviceUseCase(
        CreateDeviceParams(
          deviceToken: deviceInfo['deviceId'],
          deviceType: deviceInfo["deviceOS"],
          lang: event.language,
        ),
      );
    });
  }
}
