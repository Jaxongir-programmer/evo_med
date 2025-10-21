import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension, tr;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/list_tile_with_checkbox.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class LimitChargeDialog extends StatelessWidget {
  const LimitChargeDialog({
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
              LocaleKeys.label_contactFreeTrial.tr(args: ["1"]),
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
              text: LocaleKeys.btn_confirm.tr(),
            ),
            Gap(32),
            IntrinsicWidth(
              child: ListTileWithCheckBox(
                height: 26,
                direction: TextDirection.rtl,
                title: LocaleKeys.label_doNotRemind.tr(),
                isChecked: true,
                checkboxChanged: (bool value) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
