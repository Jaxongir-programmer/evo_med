import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.isSelected,
    required this.image,
    required this.onTap,
  });

  final bool isSelected;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 96,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.buttonPrimaryLight : AppColors.containerBloc,
            border: Border.all(
              color: isSelected ? AppColors.accentDim : AppColors.containerBloc,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(16),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
