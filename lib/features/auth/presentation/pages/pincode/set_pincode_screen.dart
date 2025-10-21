import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:pinput/pinput.dart';

class SetPinCodeScreen extends StatefulWidget {
  const SetPinCodeScreen({super.key});

  @override
  State<SetPinCodeScreen> createState() => _SetPinCodeScreenState();
}

class _SetPinCodeScreenState extends State<SetPinCodeScreen> {
  TextEditingController pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
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
                LocaleKeys.label_pleaseSetPinCode.tr(),
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
                controller: pinCodeController,
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
                autofocus: true,
                obscuringCharacter: '●',
                onChanged: (value) {
                  if (value.length == 4) {
                    context.read<AuthBloc>().add(
                          SetPinCodeEvent(
                            pinCode: value,
                            onSuccess: () {
                              context.pushNamed(AppRouter.confirmPinCode);
                            },
                          ),
                        );
                  }
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
