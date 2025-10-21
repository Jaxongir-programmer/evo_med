import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class EstateDetailItemWidget extends StatelessWidget {
  const EstateDetailItemWidget({
    super.key,
    required this.title,
    this.label = "",
    this.underlineText,
    this.onTap,
  });

  final String title;
  final String label;
  final String? underlineText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          title,
          style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
        ),
        if (underlineText == null)
          Text(
            label,
            style: context.textTheme.bodyMedium!.copyWith(
              color: AppColors.labelColor,
            ),
          )
        else
          GestureDetector(
            onTap: onTap ?? () {},
            behavior: HitTestBehavior.opaque,
            child: Text(
              underlineText!,
              style: context.textTheme.headlineSmall!.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor,
                color: AppColors.primaryColor,
              ),
            ),
          )
      ],
    );
  }
}
