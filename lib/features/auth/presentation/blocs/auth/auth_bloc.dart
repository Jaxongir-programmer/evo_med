
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:local_auth/local_auth.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/services/shared_preference_manager.dart';
import 'package:evo_med/core/util/my_functions.dart';
import 'package:evo_med/core/util/params/auth_params.dart';
import 'package:evo_med/features/auth/domain/use_cases/check_verification_code_usecase.dart';
import 'package:evo_med/features/auth/domain/use_cases/forget_password_usecase.dart';
import 'package:evo_med/features/on_boarding/domain/use_cases/create_device_usecase.dart';
import 'package:evo_med/features/auth/domain/use_cases/get_verification_code_usecase.dart';
import 'package:evo_med/features/auth/domain/use_cases/login_usecase.dart';
import 'package:evo_med/features/auth/domain/use_cases/register_usecase.dart';
import 'package:evo_med/features/auth/domain/use_cases/reset_password_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetVerificationCodeUseCase getVerificationCodeUseCase;
  final CheckVerificationCodeUseCase checkVerificationCodeUseCase;
  final RegisterUseCase registerUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final LoginUseCase loginUseCase;
  final CreateDeviceUseCase createDeviceUseCase;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  AuthBloc({
    required this.getVerificationCodeUseCase,
    required this.checkVerificationCodeUseCase,
    required this.registerUseCase,
    required this.resetPasswordUseCase,
    required this.loginUseCase,
    required this.createDeviceUseCase,
    required this.forgetPasswordUseCase,
  }) : super(const AuthState()) {
    on<GetVerificationCodeEvent>((event, emit) async {
      emit(state.copyWith(sendVerificationCodeStatus: FormzSubmissionStatus.inProgress));
      final result = await getVerificationCodeUseCase(event.phoneNumber);
      if (result.isRight) {
        emit(state.copyWith(
          sendVerificationCodeStatus: FormzSubmissionStatus.success,
          phoneNumber: event.phoneNumber,
        ));
        event.onSuccess();
      } else {
        emit(state.copyWith(sendVerificationCodeStatus: FormzSubmissionStatus.failure));
        event.onError(result.left.getErrorMessage());
      }
    });
    on<CheckVerificationCodeEvent>((event, emit) async {
      emit(state.copyWith(checkVerificationCodeStatus: FormzSubmissionStatus.inProgress));
      final result = await checkVerificationCodeUseCase(VerificationCodeParams(
        verificationCode: event.code,
        phoneNumber: state.phoneNumber,
      ));
      if (result.isRight) {
        if (result.right) {
          emit(state.copyWith(checkVerificationCodeStatus: FormzSubmissionStatus.success));
          event.onSuccess();
        } else {
          emit(state.copyWith(checkVerificationCodeStatus: FormzSubmissionStatus.failure));
          event.onError("Verification code is incorrect");
        }
      } else {
        emit(state.copyWith(checkVerificationCodeStatus: FormzSubmissionStatus.failure));
        event.onError(result.left.getErrorMessage());
      }
    });
    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(registerStatus: FormzSubmissionStatus.inProgress));
      final deviceInfo = await MyFunctions.getDeviceInfo();
      final result = await registerUseCase(RegisterParams(
        lang: event.lang,
        password: event.password,
        passwordConfirm: event.confirmPassword,
        phoneNumber: state.phoneNumber,
        firstName: event.firstName,
        lastName: event.lastName,
        deviceToken: deviceInfo['deviceId'],
      ));
      if (result.isRight) {
        emit(state.copyWith(registerStatus: FormzSubmissionStatus.success));
        add(LoginEvent(
          phoneNumber: state.phoneNumber,
          password: event.password,
          onSuccess: event.onSuccess,
          onError: event.onError,
        ));
      } else {
        emit(state.copyWith(registerStatus: FormzSubmissionStatus.failure));
        event.onError(result.left.getErrorMessage());
      }
    });
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(loginStatus: FormzSubmissionStatus.inProgress));
      final result = await loginUseCase(LoginParams(
        password: event.password,
        phoneNumber: event.phoneNumber,
      ));
      if (result.isRight) {
        SharedPreferenceManager.putString(AppConstants.token, "Bearer ${result.right.token}");
        SharedPreferenceManager.putString(AppConstants.refreshToken, result.right.refreshToken);
        emit(state.copyWith(loginStatus: FormzSubmissionStatus.success));
        event.onSuccess();
      } else {
        emit(state.copyWith(loginStatus: FormzSubmissionStatus.failure));
        event.onError(result.left.getErrorMessage());
      }
    });
    on<SetPinCodeEvent>((event, emit) async {
      emit(state.copyWith(pinCode: event.pinCode));
      event.onSuccess();
    });
    on<ConfirmPinCode>((event, emit) async {
      emit(state.copyWith(confirmPinCodeStatus: FormzSubmissionStatus.inProgress));
      if (state.pinCode == event.pinCode) {
        SharedPreferenceManager.putString(AppConstants.pinCode, event.pinCode);
        final canCheckBiometric = await _localAuthentication.canCheckBiometrics;
        final availableBiometrics = await _localAuthentication.getAvailableBiometrics();
        if (canCheckBiometric && availableBiometrics.isNotEmpty) {
          try {
            final isAuthenticated = await _localAuthentication.authenticate(
              localizedReason: 'Please authenticate to access your account',
              options: const AuthenticationOptions(useErrorDialogs: true, stickyAuth: true, biometricOnly: true),
            );
            if (isAuthenticated) {
              SharedPreferenceManager.putBool(key: AppConstants.isBiometricEnabled, value: true);
            }
          } on PlatformException catch (e) {
            print(e.message);
          }
        }
        await Future.delayed(Duration(seconds: 1));
        event.onSuccess();
        emit(state.copyWith(confirmPinCodeStatus: FormzSubmissionStatus.success));
      } else {
        event.onError("Pin code is incorrect");
      }
    });
    on<ForgetPasswordEvent>((event, emit) async {
      emit(state.copyWith(sendVerificationCodeStatus: FormzSubmissionStatus.inProgress));
      final result = await forgetPasswordUseCase(event.phoneNumber);
      if (result.isRight) {
        emit(state.copyWith(
          sendVerificationCodeStatus: FormzSubmissionStatus.success,
          phoneNumber: event.phoneNumber,
        ));
        event.onSuccess();
      } else {
        emit(state.copyWith(sendVerificationCodeStatus: FormzSubmissionStatus.failure));
        event.onError(result.left.getErrorMessage());
      }
    });
    on<SetNewPasswordEvent>((event, emit) async {
      emit(state.copyWith(setNewPasswordStatus: FormzSubmissionStatus.inProgress));
      final result = await resetPasswordUseCase(ResetPasswordParams(
        phoneNumber: state.phoneNumber,
        password: event.password,
        passwordConfirm: event.confirmPassword,
      ));
      if (result.isRight) {
        emit(state.copyWith(setNewPasswordStatus: FormzSubmissionStatus.success));
        event.onSuccess();
      } else {
        emit(state.copyWith(setNewPasswordStatus: FormzSubmissionStatus.failure));
        event.onError(result.left.getErrorMessage());
      }
    });
  }
}
