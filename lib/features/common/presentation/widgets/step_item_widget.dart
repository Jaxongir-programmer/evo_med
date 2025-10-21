import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/domain/entity/step_item_data_entity.dart';

/// Steps步骤条，水平步骤item
class StepsHorizontalItem extends StatelessWidget {
  final StepsItemData data;
  final int index;
  final int stepsCount;
  final int activeIndex;

  const StepsHorizontalItem({
    super.key,
    required this.data,
    required this.index,
    required this.stepsCount,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Opacity(
                opacity: index == 0 ? 0 : 1,
                child: Container(
                    width: double.infinity,
                    height: 2,
                    color: (activeIndex >= index) ? AppColors.successGreen : AppColors.containerBloc),
              ),
            ),
            Gap(8),
            data.successIcon.toSVGWidget(
              size: 28,
              color: (activeIndex >= index) ? AppColors.successGreen : AppColors.containerBloc,
            ),
            Gap(8),
            Expanded(
              flex: 1,
              child: Opacity(
                opacity: index == stepsCount - 1 ? 0 : 1,
                child: Container(
                  width: double.infinity,
                  height: 2,
                  color: (activeIndex >= index) ? AppColors.successGreen : AppColors.containerBloc,
                ),
              ),
            ),
          ],
        ),
        Gap(8),
        Text(
          data.title,
          style: context.textTheme.headlineSmall!.copyWith(
            fontSize: 10,
            color: (activeIndex >= index) ? AppColors.successGreen : AppColors.labelColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(4),
        Text(
          data.content,
          style: context.textTheme.displaySmall!.copyWith(
            fontSize: 14,
            color: (activeIndex >= index) ? AppColors.defaultDark : AppColors.labelColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
