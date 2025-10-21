import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class EmptyEstateWidget extends StatelessWidget {
  const EmptyEstateWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.containerBloc,
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Gap(42),
          icon.toSVGWidget(),
          Gap(24),
          Text(
            label.tr(),
            style: context.textTheme.bodyLarge!.copyWith(
              color: AppColors.labelColor,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(42),
        ],
      ),
    );
  }
}
