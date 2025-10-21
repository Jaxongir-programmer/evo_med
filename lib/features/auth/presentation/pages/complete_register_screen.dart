import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({super.key});

  @override
  State<CompleteRegisterScreen> createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            context.pop();
          }),
          surfaceTintColor: AppColors.white,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            Text(
              LocaleKeys.title_enterInformation.tr(),
              style: context.textTheme.displayLarge,
            ),
            Gap(4),
            Text(
              LocaleKeys.label_enterNameAndPassword.tr(),
              style: context.textTheme.bodyLarge!.copyWith(color: AppColors.labelColor),
            ),
            Gap(16),
            CustomTextField(
              labelText: LocaleKeys.hints_name.tr(),
              controller: firstNameController,
              onChanged: (String value) {},
              textInputAction: TextInputAction.next,
            ),
            Gap(16),
            CustomTextField(
              labelText: LocaleKeys.hints_surname.tr(),
              controller: lastNameController,
              onChanged: (String value) {},
              textInputAction: TextInputAction.next,
            ),
            Gap(16),
            CustomTextField(
              labelText: LocaleKeys.hints_password.tr(),
              controller: passwordController,
              onChanged: (String value) {},
              isObscure: true,
            ),
            Gap(16),
            CustomTextField(
              labelText: LocaleKeys.hints_confirmPassword.tr(),
              controller: confirmPasswordController,
              onChanged: (String value) {},
              isObscure: true,
            ),
          ],
        ),
        floatingActionButton: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return CustomButton(
              isLoading: state.registerStatus.isInProgress || state.loginStatus.isInProgress,
              text: LocaleKeys.btn_register.tr(),
              onTap: () {
                final password = passwordController.text.trim();
                final confirmPassword = confirmPasswordController.text.trim();

                context.read<AuthBloc>().add(
                      RegisterEvent(
                        password: password,
                        confirmPassword: confirmPassword,
                        lang: context.locale.languageCode.toLowerCase(),
                        firstName: firstNameController.text.trim(),
                        lastName: lastNameController.text.trim(),
                        onSuccess: () {
                          Future.delayed(
                            Duration(milliseconds: 500),
                            () => context.pushNamed(AppRouter.successScreen, extra: SuccessType.register),
                          );
                        },
                        onError: (error) {
                          context.showSnackBar(
                            error,
                          );
                        },
                      ),
                    );
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
