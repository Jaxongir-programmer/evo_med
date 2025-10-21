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
import 'package:evo_med/generated/locale_keys.g.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController phoneController = TextEditingController();
  final ValueNotifier<bool> errorPhoneNumber = ValueNotifier(false);

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
              LocaleKeys.title_resetPassword.tr(),
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
              builder: (context, value, child) =>
                  CustomTextField(
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
        floatingActionButton: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return CustomButton(
              isLoading: state.sendVerificationCodeStatus.isInProgress,
              text: LocaleKeys.btn_continue.tr(),
              onTap: () {
                if (phoneController.text.length < 12) {
                  errorPhoneNumber.value = true;
                } else {
                  final phoneNumber = "+998${phoneController.text.replaceAll(" ", "")}";
                  context.read<AuthBloc>().add(
                    ForgetPasswordEvent(
                      phoneNumber: phoneNumber,
                      onSuccess: () {
                        context.pushNamed(AppRouter.fpOtpConfirm);
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
              margin: EdgeInsets.symmetric(horizontal: 16),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
