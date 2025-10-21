import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class MessageItemWidget extends StatelessWidget {
  const MessageItemWidget({
    super.key,
    required this.title,
    required this.label,
    required this.onTap,
    required this.isRead,
  });

  final String title;
  final String label;
  final Function() onTap;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.containerBloc, borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  title,
                  style: context.textTheme.displaySmall!.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  label,
                  style: context.textTheme.labelMedium!.copyWith(
                    color: AppColors.labelColor,
                  ),
                ),
              ],
            ),
            if (!isRead) ...[
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: CircleAvatar(
                  backgroundColor: AppColors.badgeColor,
                  radius: 4,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
