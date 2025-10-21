import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ActiveControl extends StatelessWidget {
  const ActiveControl({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.onPlayPause,
  });

  final Function() onDelete;
  final Function() onPlayPause;
  final Function() onEdit;

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
          onTap: onPlayPause,
          child: AppIcons.pause.toSVGWidget(),
        ),
        CustomButton.light(
          isExpanded: true,
          text: LocaleKeys.btn_change.tr(),
          onTap: onEdit,
        )
      ],
    );
  }
}

class ActiveDayWidget extends StatelessWidget {
  const ActiveDayWidget({
    super.key,
    required this.day,
  });

  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.successGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          AppIcons.history.toSVGWidget(size: 18, color: AppColors.white),
          Text(
            LocaleKeys.label_activeUntil.tr(
              args: [day],
            ),
            style: context.textTheme.labelMedium!.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
