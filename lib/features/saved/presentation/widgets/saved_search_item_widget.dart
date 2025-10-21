import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class SavedSearchItemWidget extends StatelessWidget {
  const SavedSearchItemWidget({
    super.key,
    required this.title,
    required this.body,
    required this.hasResult,
  });

  final String title;
  final String body;
  final bool hasResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.containerBloc,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
                    ),
                    Gap(8),
                    Text(
                      body,
                      style: context.textTheme.bodyMedium!.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              CustomButton(
                height: 40,
                width: 40,
                onTap: () {},
                borderRadius: 9,
                child: AppIcons.trash.toSVGWidget(),
              )
            ],
          ),
          Gap(24),
          Row(
            spacing: 8,
            children: [
              CustomButton.outline(
                onTap: () {},
                height: 40,
                width: 40,
                padding: EdgeInsets.zero,
                child: AppIcons.pen.toSVGWidget(),
              ),
              CustomButton(
                onTap: () {},
                height: 40,
                isDisabled: !hasResult,
                text: hasResult ? LocaleKeys.label_newResult.tr(args: ["2"]) : LocaleKeys.label_noNewResult.tr(),
                isExpanded: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
