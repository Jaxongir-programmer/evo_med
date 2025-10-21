class VerificationCodeParams {
  final int verificationCode;
  final String phoneNumber;

  VerificationCodeParams({
    required this.verificationCode,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'code': verificationCode,
      'phone': phoneNumber,
    };
  }
}

class RegisterParams {
  final String deviceToken;
  final String password;
  final String firstName;
  final String lastName;
  final String userName;
  final String passwordConfirm;
  final String phoneNumber;
  final String lang;
  final String role;

  RegisterParams({
    required this.deviceToken,
    required this.password,
    required this.passwordConfirm,
    required this.phoneNumber,
    required this.lang,
    this.firstName = "",
    this.lastName = "",
    this.userName = "",
    this.role = "ROLE_USER",
  });

  Map<String, dynamic> toJson() {
    var map = {
      'device_token': deviceToken,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phoneNumber,
      'password': password,
      'password_confirmation': passwordConfirm,
      'lang': lang,
      'role': role,
    };

    if (userName.isNotEmpty) {
      map.addAll({
        'username': userName,
      });
    }

    return map;
  }
}

class ResetPasswordParams {
  final String phoneNumber;
  final String password;
  final String passwordConfirm;

  ResetPasswordParams({
    required this.phoneNumber,
    required this.password,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phoneNumber,
      'password': password,
      'password_confimation': passwordConfirm,
    };
  }
}

class LoginParams {
  final String phoneNumber;
  final String password;

  LoginParams({
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'login': phoneNumber,
      'password': password,
    };
  }
}

class CreateDeviceParams {
  final String deviceToken;
  final String deviceType;
  final String lang;

  CreateDeviceParams({
    required this.deviceToken,
    required this.deviceType,
    required this.lang,
  });

  Map<String, dynamic> toJson() {
    return {
      'device_token': deviceToken,
      'device_type': deviceType,
      'lang': lang,
    };
  }
}
