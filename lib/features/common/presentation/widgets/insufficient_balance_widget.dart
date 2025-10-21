import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class InsufficientBalanceWidget extends StatelessWidget {
  const InsufficientBalanceWidget({
    super.key,
    required this.onTop,
  });

  final Function() onTop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcons.circleWarning.toSVGWidget(color: AppColors.error),
            Gap(4),
            Text(
              LocaleKeys.label_notEnoughBalance.tr(),
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.error,
              ),
            ),
          ],
        ),
        CustomButton.transparent(
          text: LocaleKeys.btn_fillYourBalance.tr(),
          textColor: AppColors.primaryColor,
          onTap: () {
            onTop();
          },
        )
      ],
    );
  }
}
