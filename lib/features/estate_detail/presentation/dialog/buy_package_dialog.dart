import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class BuyPackageDialog extends StatelessWidget {
  const BuyPackageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.title_attention.tr(),
              style: context.textTheme.displayMedium,
            ),
            Gap(16),
            Text(
              LocaleKeys.label_buyPackageForContact.tr(),
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Gap(32),
            CustomButton(
              onTap: () {
                context.pop();
              },
              textStyle: context.textTheme.headlineMedium!.copyWith(
                color: AppColors.white,
              ),
              text: LocaleKeys.btn_buyPackage.tr(),
            ),
            Gap(8),
            CustomButton.light(
              onTap: () {
                context.pop();
              },
              textStyle: context.textTheme.headlineMedium!.copyWith(
                color: AppColors.white,
              ),
              text: LocaleKeys.btn_chargeFromBalance.tr(args: ["10 000"]),
            ),
            if (false) ...[
              Gap(8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppIcons.circleWarning.toSVGWidget(color: AppColors.error),
                  Gap(8),
                  Text(
                    LocaleKeys.label_notEnoughBalance.tr(),
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ],
              ),
              Gap(40),
              CustomButton.transparent(
                text: LocaleKeys.btn_fillYourBalance.tr(),
                onTap: () {
                  context.pop();
                },
              ),
            ],
            Gap(32),
            Text(
              LocaleKeys.label_yourCurrentBalance.tr(args: ["18 000"]),
              style: context.textTheme.labelMedium!.copyWith(
                color: AppColors.labelColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
