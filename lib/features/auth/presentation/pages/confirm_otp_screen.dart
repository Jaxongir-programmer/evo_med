import 'dart:async';

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
import 'package:evo_med/core/util/formatter.dart';
import 'package:evo_med/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:pinput/pinput.dart';

class ConfirmOTPScreen extends StatefulWidget {
  const ConfirmOTPScreen({super.key});

  @override
  State<ConfirmOTPScreen> createState() => _ConfirmOTPScreenState();
}

class _ConfirmOTPScreenState extends State<ConfirmOTPScreen> {
  late Timer _timer;
  final ValueNotifier<int> timerDuration = ValueNotifier(120); // 2 minutes in seconds
  final TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        timerDuration.value = timerDuration.value - 1;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.title_enterSmsCode.tr(),
                style: context.textTheme.displayLarge,
              ),
              Gap(4),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      LocaleKeys.label_weSentSmsCode.tr(
                        args: [
                          Formatters.phoneFormatter(mask: "+998 ## ### ## ##", initialText: state.phoneNumber)
                              .getMaskedText(),
                        ],
                      ),
                      style: context.textTheme.bodyLarge!.copyWith(color: AppColors.labelColor),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              Gap(32),
              Pinput(
                defaultPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                  ),
                  width: 54,
                  height: 54,
                ),
                keyboardType: TextInputType.number,
                separatorBuilder: (index) => Gap(16),
                cursor: SizedBox(),
                focusedPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border:
                        Border.all(color: AppColors.primaryColor.withOpacity(.35), width: 3, style: BorderStyle.solid),
                  ),
                  width: 54,
                  height: 54,
                ),
                autofocus: true,
                obscureText: true,
                controller: pinController,
                obscuringCharacter: '●',
                onChanged: (value) {
                  if (value.length == 4) {
                    context.read<AuthBloc>().add(
                          CheckVerificationCodeEvent(
                            code: value.toInt(),
                            onSuccess: () {
                              context.goNamed(AppRouter.completeRegister);
                            },
                            onError: (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(error),
                                ),
                              );
                            },
                          ),
                        );
                  }
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state.checkVerificationCodeStatus.isInProgress) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: CupertinoActivityIndicator(color: AppColors.primaryColor),
                    ));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              Gap(16),
              ValueListenableBuilder(
                valueListenable: timerDuration,
                builder: (context, value, child) => CustomButton.transparent(
                  isDisabled: value > 0,
                  text: LocaleKeys.btn_resent.tr(args: [
                    value > 0
                        ? "${(value ~/ 60).toString().padLeft(2, '0')}:${(value % 60).toString().padLeft(2, '0')}"
                        : ""
                  ]),
                  onTap: () {
                    context.read<AuthBloc>().add(
                          GetVerificationCodeEvent(
                            phoneNumber: context.read<AuthBloc>().state.phoneNumber,
                            onSuccess: () {
                              timerDuration.value = 120;
                            },
                            onError: (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(error),
                                ),
                              );
                            },
                          ),
                        );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: CustomButton(
          width: 48,
          height: 48,
          onTap: () {
            context.pop();
          },
          color: Colors.transparent,
          borderRadius: 8,
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          child: AppIcons.arrowLeft.toSVGWidget(
            color: AppColors.primaryColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
