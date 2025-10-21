import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/services/shared_preference_manager.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ForgetPinCodeModal extends StatelessWidget {
  const ForgetPinCodeModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.padding.bottom, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 24,
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: 48,
              decoration: BoxDecoration(
                color: AppColors.dividerColor,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          SizedBox(
            height: 64,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  top: 0,
                  child: AppIcons.chevronLeft.toSVGWidget(
                    onTap: () {
                      context.pop();
                    },
                  ),
                ),
                Center(
                  child: Text(
                    LocaleKeys.title_forgetPinCode.tr(),
                    style: context.textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
          Gap(16),
          Text(
            LocaleKeys.label_toRestorePinCodeLogout.tr(),
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          Gap(54),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: LocaleKeys.btn_cancel.tr(),
                  textColor: AppColors.primaryColor,
                  color: Colors.transparent,
                  onTap: () {
                    context.pop();
                  },
                ),
              ),
              Gap(16),
              Expanded(
                child: CustomButton(
                  text: LocaleKeys.btn_logout.tr(),
                  onTap: () {
                    SharedPreferenceManager.deleteString(AppConstants.token);
                    SharedPreferenceManager.deleteString(AppConstants.refreshToken);
                    SharedPreferenceManager.deleteString(AppConstants.isBiometricEnabled);
                    SharedPreferenceManager.deleteString(AppConstants.pinCode);
                    context.read<ProfileBloc>().add(ClearInfoEvent());
                    context.goNamed(AppRouter.home);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
