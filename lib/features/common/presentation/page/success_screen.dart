import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

import '../../../../core/util/enums/enums.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key, required this.type});

  final SuccessType type;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    if (!widget.type.isNewPassword && !widget.type.isModeration) {
      Timer(
        Duration(seconds: 1),
        () {
          if (widget.type.isIdentification) {
            context.popUntil(AppRouter.myEstates);
          } else {
            context.goNamed(AppRouter.setPinCode);
          }
        },
      );
    }
    super.initState();
  }

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
                    widget.type.isRegister
                        ? LocaleKeys.label_successfullyRegistered.tr()
                        : widget.type.isIdentification
                            ? LocaleKeys.label_identificationSuccessfully.tr()
                            : widget.type.isModeration
                                ? LocaleKeys.title_announcementSentToModeration.tr()
                                : LocaleKeys.label_passwordResetSuccessfully.tr(),
                    style: context.textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(8),
                if (widget.type.isIdentification)
                  Text(
                    LocaleKeys.label_estatesLoading.tr(),
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: AppColors.labelColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                if (widget.type.isModeration)
                  Text(
                    LocaleKeys.label_seeStatusInMyAnnouncement.tr(),
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
      floatingActionButton: widget.type.isNewPassword || widget.type.isModeration
          ? CustomButton(
              text: LocaleKeys.btn_backToHome.tr(),
              onTap: () {
                context.goNamed(AppRouter.home);
              },
              margin: EdgeInsets.symmetric(horizontal: 16),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
