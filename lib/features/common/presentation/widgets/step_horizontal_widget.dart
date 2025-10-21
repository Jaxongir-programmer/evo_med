import 'package:flutter/material.dart';
import 'package:evo_med/features/common/domain/entity/step_item_data_entity.dart';
import 'package:evo_med/features/common/presentation/widgets/step_item_widget.dart';

class StepsHorizontal extends StatelessWidget {
  final List<StepsItemData> steps;
  final int activeIndex;

  const StepsHorizontal({
    super.key,
    required this.steps,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    final stepsCount = steps.length;
    List<Widget> stepsHorizontalItem = steps.asMap().entries.map((item) {
      return Expanded(
        flex: 1,
        child: StepsHorizontalItem(
          index: item.key,
          data: item.value,
          stepsCount: stepsCount,
          activeIndex: activeIndex,
        ),
      );
    }).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stepsHorizontalItem,
    );
  }
}
