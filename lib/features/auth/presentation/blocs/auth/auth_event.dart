part of 'auth_bloc.dart';

abstract class AuthEvent {}

class GetVerificationCodeEvent extends AuthEvent {
  final String phoneNumber;
  final Function() onSuccess;
  final Function(String error) onError;

  GetVerificationCodeEvent({
    required this.phoneNumber,
    required this.onSuccess,
    required this.onError,
  });
}

class CheckVerificationCodeEvent extends AuthEvent {
  final int code;
  final Function() onSuccess;
  final Function(String error) onError;

  CheckVerificationCodeEvent({
    required this.code,
    required this.onSuccess,
    required this.onError,
  });
}

class RegisterEvent extends AuthEvent {
  final String password;
  final String confirmPassword;
  final String firstName;
  final String lastName;
  final String lang;
  final Function() onSuccess;
  final Function(String error) onError;

  RegisterEvent({
    required this.password,
    required this.confirmPassword,
    required this.lang,
    required this.firstName,
    required this.lastName,
    required this.onSuccess,
    required this.onError,
  });
}

class LoginEvent extends AuthEvent {
  final String phoneNumber;
  final String password;
  final Function() onSuccess;
  final Function(String error) onError;

  LoginEvent({
    required this.phoneNumber,
    required this.password,
    required this.onSuccess,
    required this.onError,
  });
}

class SetPinCodeEvent extends AuthEvent {
  final String pinCode;
  final Function() onSuccess;

  SetPinCodeEvent({
    required this.pinCode,
    required this.onSuccess,
  });
}

class ConfirmPinCode extends AuthEvent {
  final String pinCode;
  final Function() onSuccess;
  final Function(String error) onError;

  ConfirmPinCode({
    required this.pinCode,
    required this.onSuccess,
    required this.onError,
  });
}

class ForgetPasswordEvent extends AuthEvent {
  final String phoneNumber;
  final Function() onSuccess;
  final Function(String error) onError;

  ForgetPasswordEvent({
    required this.phoneNumber,
    required this.onSuccess,
    required this.onError,
  });
}

class SetNewPasswordEvent extends AuthEvent {
  final String password;
  final String confirmPassword;
  final Function() onSuccess;
  final Function(String error) onError;

  SetNewPasswordEvent({
    required this.password,
    required this.confirmPassword,
    required this.onSuccess,
    required this.onError,
  });
}
