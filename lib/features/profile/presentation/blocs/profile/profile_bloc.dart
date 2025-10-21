import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/services/shared_preference_manager.dart';
import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/util/my_functions.dart';
import 'package:evo_med/features/profile/domain/entities/profile_entity.dart';
import 'package:evo_med/features/profile/domain/entities/user_tariff_entity.dart';
import 'package:evo_med/features/profile/domain/use_cases/profile_usecase.dart';
import 'package:evo_med/features/profile/domain/use_cases/update_device_last_activity_usecase.dart';
import 'package:evo_med/features/profile/domain/use_cases/update_user_activity_usecase.dart';
import 'package:evo_med/features/profile/domain/use_cases/user_tariffs_usecase.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase profileUseCase;
  final UpdateDeviceLastActivityUseCase updateDeviceLastActivityUseCase;
  final UpdateUserActivityUseCase updateUserActivityUseCase;

  ProfileBloc({
    required this.profileUseCase,
    required this.updateDeviceLastActivityUseCase,
    required this.updateUserActivityUseCase,
  }) : super(const ProfileState()) {
    on<ProfileGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await profileUseCase('');
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          profile: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
    on<ClearInfoEvent>((event, emit) async {
      emit(state.copyWith(profile: ProfileEntity()));
    });
    on<UpdateDeviceLastActivityEvent>((event, emit) async {
      if (SharedPreferenceManager.getString(AppConstants.token, defValue: '').isNotEmpty) {
        final deviceInfo = await MyFunctions.getDeviceInfo();
        updateDeviceLastActivityUseCase(deviceInfo['deviceId']);
      }
    });
    on<UpdateUserActivityEvent>((event, emit) async {
      if (SharedPreferenceManager.getString(AppConstants.token, defValue: '').isNotEmpty) {
        updateUserActivityUseCase(NoParams());
      }
    });
  }
}
