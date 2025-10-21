import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:evo_med/features/common/presentation/widgets/custom_checkbox.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ValueNotifier<bool> isPrivacyAccepted = ValueNotifier(false);
  final ValueNotifier<bool> notAccepted = ValueNotifier(false);
  final ValueNotifier<bool> errorPhoneNumber = ValueNotifier(false);
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          goBack(context);
        },
        child: Scaffold(
          appBar: AppBar(
            leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
              goBack(context);
            }),
            surfaceTintColor: AppColors.white,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              Text(
                LocaleKeys.title_register.tr(),
                style: context.textTheme.displayLarge,
              ),
              Gap(4),
              Text(
                LocaleKeys.label_enterYourNumber.tr(),
                style: context.textTheme.bodyLarge!.copyWith(color: AppColors.labelColor),
              ),
              Gap(16),
              ValueListenableBuilder(
                valueListenable: errorPhoneNumber,
                builder: (context, value, child) => CustomTextField(
                  prefix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Gap(16),
                      AppIcons.flagUz.toSVGWidget(),
                      Gap(4),
                      Text(
                        '+998',
                        style: context.textTheme.bodyLarge,
                      ),
                      Gap(12)
                    ],
                  ),
                  prefixMaxWidth: 94,
                  errorText: LocaleKeys.label_errorPhoneNumber.tr(),
                  hasError: value,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(12),
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    Formatters.phoneFormatter(mask: "## ### ## ##", initialText: phoneController.text),
                  ],
                  keyboardType: TextInputType.phone,
                  hintText: "00 000 00 00",
                  controller: phoneController,
                  onChanged: (String value) {
                    errorPhoneNumber.value = false;
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: notAccepted,
                      builder: (context, notSelected, child) => ValueListenableBuilder(
                        valueListenable: isPrivacyAccepted,
                        builder: (context, value, child) => CustomCheckBoxClickable(
                          isError: notSelected,
                          value: value,
                          onChange: (bool value) {
                            isPrivacyAccepted.value = value;
                            if (value) {
                              notAccepted.value = false;
                            }
                          },
                        ),
                      ),
                    ),
                    Gap(12),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(text: LocaleKeys.label_privacy1.tr()),
                        TextSpan(
                          text: LocaleKeys.label_privacy2.tr(),
                          style: context.textTheme.headlineMedium!.copyWith(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(AppRouter.privacyPolicy).then((value) {
                                if (value != null) {
                                  isPrivacyAccepted.value = (value as String).isNotEmpty;
                                  notAccepted.value = !(value).isNotEmpty;
                                }
                              });
                            },
                        ),
                        TextSpan(text: LocaleKeys.label_privacy3.tr()),
                      ], style: context.textTheme.bodyLarge),
                    )
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: notAccepted,
                  builder: (context, value, child) {
                    if (value) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 38),
                        child: SizedBox(
                          height: 32,
                          child: Text(
                            LocaleKeys.label_pleaseConfirmPrivacy.tr(),
                            style: context.textTheme.labelMedium!.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      );
                    } else {
                      return Gap(32);
                    }
                  },
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.sendVerificationCodeStatus.isInProgress,
                      text: LocaleKeys.btn_continue.tr(),
                      onTap: () {
                        if (phoneController.text.length < 12) {
                          errorPhoneNumber.value = true;
                        } else if (!isPrivacyAccepted.value) {
                          notAccepted.value = true;
                          return;
                        } else {
                          final phoneNumber = "+998${phoneController.text.replaceAll(" ", "")}";
                          context.read<AuthBloc>().add(
                                GetVerificationCodeEvent(
                                  phoneNumber: phoneNumber,
                                  onSuccess: () {
                                    context.pushNamed(AppRouter.confirmOtpScreen);
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
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  void goBack(BuildContext context) {
    if (context.canPop()) {
      context.goNamed(AppRouter.home);
    } else {
      context.pop();
    }
  }
}
