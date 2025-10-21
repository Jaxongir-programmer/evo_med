import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  const ProfileMenuItemWidget({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
    this.arrow,
    this.subtitle,
    this.isShowArrow = true,
    this.isDivider = true,
    this.titleColor = AppColors.defaultDark,
  });

  final String title;
  final Widget? icon;
  final Widget? arrow;
  final String? subtitle;
  final Function()? onTap;
  final bool isShowArrow;
  final bool isDivider;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: isDivider
            ? BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.dividerColor)),
              )
            : null,
        child: Row(
          spacing: 16,
          children: [
            if (icon != null) icon!,
            SizedBox(
              height: 44,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: titleColor,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: context.textTheme.bodyMedium!.copyWith(color: AppColors.labelColor),
                    ),
                ],
              ),
            ),
            if (isShowArrow) ...[
              Spacer(),
              AppIcons.chevronRight.toSVGWidget(),
            ],
            if (arrow != null) ...[
              Spacer(),
              arrow!,
            ]
          ],
        ),
      ),
    );
  }
}
