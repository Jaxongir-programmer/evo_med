import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class EstateItemRowWidget extends StatelessWidget {
  const EstateItemRowWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.label,
  });

  final String icon;
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        icon.toSVGWidget(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(
                title,
                style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
              ),
              Text(
                label,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.labelColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
