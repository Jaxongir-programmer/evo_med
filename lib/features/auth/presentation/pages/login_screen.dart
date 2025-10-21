import 'package:easy_localization/easy_localization.dart';
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
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> errorPhoneNumber = ValueNotifier(false);
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.pushNamed(AppRouter.home);
            }
          }),
          surfaceTintColor: AppColors.white,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            Text(
              LocaleKeys.title_login.tr(),
              style: context.textTheme.displayLarge,
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
                labelText: LocaleKeys.hints_phoneNumber.tr(),
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
                  if (value.length == 12) {
                    focusNode.requestFocus();
                  }
                  errorPhoneNumber.value = false;
                },
              ),
            ),
            // CustomTextField(
            //   labelText: LocaleKeys.hints_phoneNumber.tr(),
            //   controller: TextEditingController(),
            //   onChanged: (String value) {},
            //   textInputAction: TextInputAction.next,
            //   keyboardType: TextInputType.phone,
            // ),
            Gap(16),
            CustomTextField(
              labelText: LocaleKeys.hints_password.tr(),
              controller: passwordController,
              onChanged: (String value) {},
              focusNode: focusNode,
              isObscure: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IntrinsicWidth(
                child: CustomButton.transparent(
                  text: LocaleKeys.btn_forgetPassword.tr(),
                  textStyle: context.textTheme.headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700, color: AppColors.primaryColor),
                  onTap: () {
                    context.pushNamed(AppRouter.forgetPassword);
                  },
                ),
              ),
            ),
            Divider(
              color: AppColors.dividerColor,
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                LocaleKeys.label_haveYouRegistered.tr(),
                style: context.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            CustomButton(
              text: LocaleKeys.btn_register.tr(),
              textColor: AppColors.primaryColor,
              color: AppColors.buttonPrimaryLight,
              onTap: () {
                context.pushNamed(AppRouter.register);
              },
            )
          ],
        ),
        floatingActionButton: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return CustomButton(
              text: LocaleKeys.btn_continue.tr(),
              isLoading: state.loginStatus.isInProgress,
              onTap: () {
                final phoneNumber = "+998${phoneController.text.replaceAll(" ", "")}";
                context.read<AuthBloc>().add(LoginEvent(
                      phoneNumber: phoneNumber,
                      password: passwordController.text,
                      onSuccess: () {
                        context.read<ProfileBloc>().add(ProfileGetEvent());
                        context.pushNamed(AppRouter.setPinCode);
                      },
                      onError: (error) {
                        context.showSnackBar(
                          error,
                        );
                      },
                    ));
              },
              margin: EdgeInsets.symmetric(horizontal: 16),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
