import 'package:flutter/material.dart';
import 'package:evo_med/features/common/domain/entity/step_item_data_entity.dart';
import 'package:evo_med/features/common/presentation/widgets/step_horizontal_widget.dart';

class Steps extends StatefulWidget {
  const Steps({
    super.key,
    required this.steps,
    this.activeIndex = 0,
  });

  final List<StepsItemData> steps;
  final int activeIndex;

  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  @override
  Widget build(BuildContext context) {
    final currentActiveIndex = widget.activeIndex < 0
        ? 0
        : (widget.activeIndex >= widget.steps.length ? widget.steps.length - 1 : widget.activeIndex);
    return StepsHorizontal(
      steps: widget.steps,
      activeIndex: currentActiveIndex,
    );
  }
}
