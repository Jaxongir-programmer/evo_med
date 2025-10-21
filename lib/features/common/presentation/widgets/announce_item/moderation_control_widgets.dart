import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ModerationCanceledControl extends StatelessWidget {
  const ModerationCanceledControl({
    super.key,
    required this.onDelete,
    required this.onResent,
  });

  final Function() onDelete;
  final Function() onResent;

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
        CustomButton.light(
          isExpanded: true,
          text: LocaleKeys.btn_resent.tr(),
          onTap: onResent,
        )
      ],
    );
  }
}

class ModerationCanceledInfo extends StatelessWidget {
  const ModerationCanceledInfo({
    super.key,
    required this.onEdit,
  });

  final Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(12),
        Row(
          spacing: 4,
          children: [
            AppIcons.triangleWarning.toSVGWidget(),
            Text(
              LocaleKeys.title_didNotPassModeration.tr(),
              style: context.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        Gap(8),
        Text(
          "Ko’chmas mulkka taaluqli rasmlar uyga tegishli emasligi aniqlandi.",
          style: context.textTheme.bodyMedium,
        ),
        Gap(8),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                text: LocaleKeys.btn_changeInfo.tr(),
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 12),
                textStyle: context.textTheme.headlineSmall,
                onTap: onEdit,
              ),
            ],
          ),
        ),
        Gap(8)
      ],
    );
  }
}

class ModerationInfoWidget extends StatelessWidget {
  const ModerationInfoWidget({super.key, required this.onCancel});

  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.containerBloc,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text(
                LocaleKeys.label_reservedAmount.tr(),
                style: context.textTheme.headlineSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(LocaleKeys.label_uzs.tr(args: ["20 000"]), style: context.textTheme.bodyLarge),
                  Text(
                    "11:23, 12.12.2025",
                    style: context.textTheme.labelMedium!.copyWith(
                      color: AppColors.labelColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(8),
        CustomButton.light(
          text: LocaleKeys.btn_cancelModeration.tr(),
          onTap: onCancel,
        ),
        Gap(8),
        Center(
          child: Text(
            LocaleKeys.label_moderationLasts.tr(args: ['48']),
            style: context.textTheme.labelMedium!.copyWith(color: AppColors.labelColor),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class ModerationDayWidget extends StatelessWidget {
  const ModerationDayWidget({
    super.key,
    required this.day,
  });

  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.infoBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          AppIcons.clockTwo.toSVGWidget(size: 18, color: AppColors.white),
          Text(
            LocaleKeys.label_sentIn.tr(
              args: [day],
            ),
            style: context.textTheme.labelMedium!.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
