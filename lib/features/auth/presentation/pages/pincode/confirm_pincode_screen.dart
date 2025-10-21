import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:pinput/pinput.dart';

class ConfirmPinCodeScreen extends StatelessWidget {
  ConfirmPinCodeScreen({super.key});

  final ValueNotifier<bool> _matched = ValueNotifier(true);
  final TextEditingController pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            context.pop();
          }),
          title: Text(
            LocaleKeys.title_setPinCode.tr(),
            style: context.textTheme.displaySmall,
          ),
          surfaceTintColor: AppColors.white,
        ),
        extendBodyBehindAppBar: true,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.label_pleaseConfirmPinCode.tr(),
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
                keyboardType: TextInputType.number,
                separatorBuilder: (index) => Gap(16),
                cursor: SizedBox(),
                focusedPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(.35),
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                  ),
                  width: 64,
                  height: 64,
                ),
                obscureText: true,
                autofocus: true,
                controller: pinCodeController,
                obscuringCharacter: '●',
                onCompleted: (value) {
                  if (value.length == 4) {
                    context.read<AuthBloc>().add(ConfirmPinCode(
                      pinCode: value,
                      onSuccess: () async {
                        context.read<ProfileBloc>().add(ProfileGetEvent());
                        Future.delayed(
                          Duration(seconds: 1),
                              () => context.goNamed(AppRouter.loginWithPinCode),
                        );
                      },
                      onError: (error) {
                        _matched.value = false;
                      },
                    ));
                  }
                },
                onChanged: (value) {
                  _matched.value = true;
                },
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, profileState) {
                  return BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state.confirmPinCodeStatus.isInProgress || profileState.status.isInProgress) {
                        return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: CupertinoActivityIndicator(color: AppColors.primaryColor),
                            ));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  );
                },
              ),
              Gap(24),
              ValueListenableBuilder<bool>(
                valueListenable: _matched,
                builder: (context, value, child) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: value
                        ? SizedBox.shrink()
                        : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        LocaleKeys.label_pinCodeDoesNotMatch.tr(),
                        style: context.textTheme.bodyMedium!.copyWith(color: AppColors.error),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: IntrinsicWidth(
          child: CustomButton(
            text: LocaleKeys.btn_clear.tr(),
            height: 48,
            onTap: () {
              pinCodeController.clear();
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
}
