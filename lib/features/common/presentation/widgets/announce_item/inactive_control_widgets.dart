import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class InActiveControl extends StatelessWidget {
  const InActiveControl({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.onActive,
  });

  final Function() onDelete;
  final Function() onEdit;
  final Function() onActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        CustomButton(
          width: 48,
          onTap: onDelete,
          color: AppColors.dangerColor,
          child: AppIcons.trashBold.toSVGWidget(),
        ),
        CustomButton(
          width: 48,
          onTap: onEdit,
          child: AppIcons.pen.toSVGWidget(color: AppColors.white),
        ),
        CustomButton.light(
          isExpanded: true,
          text: LocaleKeys.btn_activate.tr(),
          onTap: onActive,
        )
      ],
    );
  }
}

class InActiveInfoWidget extends StatelessWidget {
  const InActiveInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(8),
        Text(
          LocaleKeys.label_dateOfPosting.tr(args: ["12-dekabr, 2024"]),
          style: context.textTheme.labelMedium,
        ),
        Gap(4),
        Text(
          LocaleKeys.label_dateOfSuspension.tr(args: ["18-dekabr, 2024"]),
          style: context.textTheme.labelMedium,
        ),
        Gap(4),
        Text(
          LocaleKeys.label_usedDays.tr(args: ["13/30"]),
          style: context.textTheme.labelMedium,
        ),
        Gap(4),
        Text(
          LocaleKeys.label_reactivation.tr(args: ["12-mart, 2025"]),
          style: context.textTheme.labelMedium,
        ),
        Gap(8),
      ],
    );
  }
}
