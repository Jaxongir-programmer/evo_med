part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final FormzSubmissionStatus sendVerificationCodeStatus;
  final FormzSubmissionStatus checkVerificationCodeStatus;
  final FormzSubmissionStatus registerStatus;
  final FormzSubmissionStatus loginStatus;
  final FormzSubmissionStatus setNewPasswordStatus;
  final FormzSubmissionStatus confirmPinCodeStatus;
  final String phoneNumber;
  final String pinCode;

  const AuthState({
    this.sendVerificationCodeStatus = FormzSubmissionStatus.initial,
    this.checkVerificationCodeStatus = FormzSubmissionStatus.initial,
    this.registerStatus = FormzSubmissionStatus.initial,
    this.loginStatus = FormzSubmissionStatus.initial,
    this.setNewPasswordStatus = FormzSubmissionStatus.initial,
    this.confirmPinCodeStatus = FormzSubmissionStatus.initial,
    this.phoneNumber = '',
    this.pinCode = '',
  });

  @override
  List<Object?> get props => [
        sendVerificationCodeStatus,
        checkVerificationCodeStatus,setNewPasswordStatus,confirmPinCodeStatus,
        registerStatus,
        loginStatus,
        phoneNumber,
        pinCode,
      ];

  AuthState copyWith({
    FormzSubmissionStatus? sendVerificationCodeStatus,
    FormzSubmissionStatus? checkVerificationCodeStatus,
    FormzSubmissionStatus? registerStatus,
    FormzSubmissionStatus? loginStatus,
    FormzSubmissionStatus? setNewPasswordStatus,
    FormzSubmissionStatus? confirmPinCodeStatus,
    String? phoneNumber,
    String? pinCode,
  }) {
    return AuthState(
      sendVerificationCodeStatus: sendVerificationCodeStatus ?? this.sendVerificationCodeStatus,
      checkVerificationCodeStatus: checkVerificationCodeStatus ?? this.checkVerificationCodeStatus,
      setNewPasswordStatus: setNewPasswordStatus ?? this.setNewPasswordStatus,
      confirmPinCodeStatus: confirmPinCodeStatus ?? this.confirmPinCodeStatus,
      registerStatus: registerStatus ?? this.registerStatus,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      loginStatus: loginStatus ?? this.loginStatus,
      pinCode: pinCode ?? this.pinCode,
    );
  }
}
