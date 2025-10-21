import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';

class DragWidget extends StatelessWidget {
  const DragWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      alignment: Alignment.center,
      child: Container(
        height: 5,
        width: 48,
        decoration: BoxDecoration(
          color: AppColors.dividerColor,
          borderRadius: BorderRadius.circular(2.5),
        ),
      ),
    );
  }
}
