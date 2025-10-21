import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_radio_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class DeleteAnnounceDialog extends StatelessWidget {
  const DeleteAnnounceDialog({
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                LocaleKeys.title_attention.tr(),
                style: context.textTheme.displayMedium,
              ),
            ),
            Gap(16),
            Text(
              LocaleKeys.label_announceDelete.tr(),
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Gap(32),
            Text(
              LocaleKeys.label_doYouSell.tr(),
              style: context.textTheme.headlineLarge,
            ),
            Gap(16),
            CustomRadioButton(
              value: false,
              onChanged: (value) {},
              text: LocaleKeys.label_sellByApp.tr(),
            ),
            Gap(16),
            CustomRadioButton(
              value: false,
              onChanged: (value) {},
              text: LocaleKeys.label_sellByOther.tr(),
            ),
            Gap(16),
            CustomRadioButton(
              value: false,
              onChanged: (value) {},
              text: LocaleKeys.label_doNotSell.tr(),
            ),
            Gap(32),
            CustomButton(
              onTap: () {
                context.pop();
              },
              textStyle: context.textTheme.headlineMedium!.copyWith(
                color: AppColors.white,
              ),
              text: LocaleKeys.btn_delete.tr(),
            ),
            Gap(8),
            CustomButton.light(
              onTap: () {
                context.pop();
              },
              textStyle: context.textTheme.headlineMedium!.copyWith(
                color: AppColors.white,
              ),
              text: LocaleKeys.btn_cancel.tr(args: ["10 000"]),
            ),
          ],
        ),
      ),
    );
  }
}
