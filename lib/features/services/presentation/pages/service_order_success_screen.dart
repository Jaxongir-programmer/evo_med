import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ServiceOrderSuccessScreen extends StatefulWidget {
  const ServiceOrderSuccessScreen({super.key});

  @override
  State<ServiceOrderSuccessScreen> createState() => _ServiceOrderSuccessScreen();
}

class _ServiceOrderSuccessScreen extends State<ServiceOrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: context.padding.top + 18,
            left: 0,
            right: 0,
            child: Divider(color: AppColors.dividerColor),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 120,
                  backgroundColor: AppColors.placeHolder,
                ),
                Gap(24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    LocaleKeys.title_orderAccepted.tr(),
                    style: context.textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(8),
                Text(
                  LocaleKeys.label_soonExpertContacts.tr(),
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: AppColors.labelColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: CustomButton(
        text: LocaleKeys.btn_backToHome.tr(),
        onTap: () {
          context.goNamed(AppRouter.home);
        },
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
