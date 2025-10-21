import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class DraftAnnouncementItem extends StatelessWidget {
  const DraftAnnouncementItem({
    super.key,
    required this.onTap,
    required this.onDelete,
    required this.onContinue,
    required this.draftInfo,
  });

  final Function() onTap;
  final Function() onDelete;
  final Function() onContinue;
  final String draftInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              draftInfo,
              style: context.textTheme.labelMedium,
            ),
          ),
        ),
        Row(
          spacing: 8,
          children: [
            CustomButton(
              width: 48,
              onTap: onDelete,
              color: AppColors.dangerColor,
              child: AppIcons.trashBold.toSVGWidget(),
            ),
            CustomButton.light(
              isExpanded: true,
              text: LocaleKeys.btn_enterInfo.tr(),
              onTap: onContinue,
            )
          ],
        ),
      ],
    );
  }
}
