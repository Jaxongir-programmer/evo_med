import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ChargeBottomSheet extends StatelessWidget {
  const ChargeBottomSheet({
    super.key,
    required this.chargeAmount,
  });

  final String chargeAmount;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: LocaleKeys.title_attention.tr(),
      onLeadingTap: () {
        context.pop();
      },
      controlWidget: CustomButton(
        text: LocaleKeys.btn_confirm.tr(),
        onTap: () {
          context.pushNamed(AppRouter.myEstateIdentify);
        },
      ),
      content: ListView(
        shrinkWrap: true,
        children: [
          Gap(24),
          LocaleKeys.label_willChargeFromBalance.tr().toStyle(
            style: context.textTheme.bodyLarge!,
            defStyle: context.textTheme.displaySmall!,
            args: [chargeAmount],
          ),
          if (false) ...[
            Gap(16),
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
          ],
        ],
      ),
    );
  }
}
