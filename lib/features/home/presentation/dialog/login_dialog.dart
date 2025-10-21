import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class FreeTrialCongrats extends StatelessWidget {
  const FreeTrialCongrats({
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
              LocaleKeys.title_congrats.tr(),
              style: context.textTheme.displayMedium,
            ),
            Gap(16),
            LocaleKeys.label_freeTrial.tr().toStyle(
                  style: context.textTheme.bodyLarge!,
                  defStyle: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
                  args: [LocaleKeys.label_freeTrialCount.tr()],
                  maxLines: 4,
                ),
            Gap(32),
            CustomButton(
              onTap: () {
                context.pop();
              },
              textStyle: context.textTheme.headlineMedium!.copyWith(
                color: AppColors.white,
              ),
              text: LocaleKeys.btn_close.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
