import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class LocaleItem extends StatelessWidget {
  const LocaleItem({
    super.key,
    required this.localeText,
    required this.selectedItem,
  });

  final String localeText;
  final bool selectedItem;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selectedItem ? AppColors.selectedLocaleAccent : AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        style: context.textTheme.headlineMedium!.copyWith(color: AppColors.localeButtonText),
        localeText,
      ),
    );
  }
}
