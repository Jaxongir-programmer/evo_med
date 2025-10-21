import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:local_auth/local_auth.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/services/shared_preference_manager.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/auth/presentation/widgets/forget_pin_code_modal.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:pinput/pinput.dart';

class LoginWithPinCodeScreen extends StatefulWidget {
  const LoginWithPinCodeScreen({super.key});

  @override
  State<LoginWithPinCodeScreen> createState() => _LoginWithPinCodeScreenState();
}

class _LoginWithPinCodeScreenState extends State<LoginWithPinCodeScreen> {
  final TextEditingController pinCodeController = TextEditingController();

  @override
  void initState() {
    biometricLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          // leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          //   context.pop();
          // }),
          surfaceTintColor: AppColors.white,
        ),
        extendBodyBehindAppBar: true,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.title_welcome.tr(args: ["Isroiljon"]),
                style: context.textTheme.displaySmall,
              ),
              Gap(32),
              Pinput(
                defaultPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                  ),
                  width: 64,
                  height: 64,
                ),
                autofocus: true,
                keyboardType: TextInputType.number,
                separatorBuilder: (index) => Gap(16),
                cursor: SizedBox(),
                focusedPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border:
                        Border.all(color: AppColors.primaryColor.withOpacity(.35), width: 3, style: BorderStyle.solid),
                  ),
                  width: 64,
                  height: 64,
                ),
                obscureText: true,
                obscuringCharacter: '●',
                controller: pinCodeController,
                onChanged: (value) {
                  if (value.length == 4) {
                    if (pinCodeController.text == SharedPreferenceManager.getString(AppConstants.pinCode)) {
                      Future.delayed(Duration(milliseconds: 500), () => context.goNamed(AppRouter.home));
                    } else {
                      context.showSnackBar("Invalid PIN code");
                    }
                  }
                },
              ),
              Gap(24),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    builder: (context) {
                      return ForgetPinCodeModal();
                    },
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: Text(
                  LocaleKeys.title_forgetPinCode.tr(),
                  style: context.textTheme.headlineSmall!.copyWith(color: AppColors.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: IntrinsicWidth(
          child: CustomButton(
            text: LocaleKeys.btn_clear.tr(),
            onTap: () {
              context.pop();
            },
            color: Colors.transparent,
            textColor: AppColors.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 16),
            borderRadius: 8,
            border: Border.all(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }

  Future<void> biometricLogin(BuildContext context) async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    if (SharedPreferenceManager.getBool(AppConstants.isBiometricEnabled, defValue: false)) {
      final isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Please authenticate to access your account',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (isAuthenticated) {
        context.goNamed(AppRouter.home);
      } else {
        context.showSnackBar("Biometric authentication failed");
      }
    }
  }
}
