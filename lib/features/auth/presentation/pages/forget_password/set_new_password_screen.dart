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

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            context.goNamed(AppRouter.login);
          }),
          surfaceTintColor: AppColors.white,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            Text(
              LocaleKeys.title_setNewPassword.tr(),
              style: context.textTheme.displayLarge,
            ),
            Gap(4),
            Text(
              LocaleKeys.label_writePassword.tr(),
              style: context.textTheme.bodyLarge!.copyWith(color: AppColors.labelColor),
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
              isLoading: state.setNewPasswordStatus.isInProgress,
              text: LocaleKeys.btn_continue.tr(),
              onTap: () {
                final password = passwordController.text.trim();
                final confirmPassword = confirmPasswordController.text.trim();
                context.read<AuthBloc>().add(
                      SetNewPasswordEvent(
                        password: password,
                        confirmPassword: confirmPassword,
                        onSuccess: () {
                          context.goNamed(AppRouter.successScreen, extra: SuccessType.newPassword);
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
