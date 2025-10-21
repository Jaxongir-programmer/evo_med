import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class ListTileTarget extends StatelessWidget {
  const ListTileTarget({
    super.key,
    required this.title,
    this.label = "",
    required this.onTab,
    this.content,
  });

  final String title;
  final String label;
  final Widget? content;
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: onTab,
        behavior: HitTestBehavior.opaque,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodyLarge,
                  ),
                  if (label.isNotEmpty)
                    Text(
                      label,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppColors.hintColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                ],
              ),
            ),
            if (content != null) ...[
              Gap(8),
              content!,
              Gap(16),
            ],
            AppIcons.chevronRight.toSVGWidget(),
          ],
        ),
      ),
    );
  }
}
