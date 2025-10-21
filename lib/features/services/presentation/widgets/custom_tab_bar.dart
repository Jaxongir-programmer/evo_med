import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({
    super.key,
    required this.pageController,
  });

  final ValueNotifier<bool> isReadyForSale = ValueNotifier(false);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isReadyForSale,
      builder: (context, value, child) => Row(
        spacing: 8,
        children: [
          Expanded(
            child: CustomButton(
              height: 30,
              color: !value ? AppColors.defaultDark : AppColors.unselectedButton,
              textColor: !value ? AppColors.white : AppColors.hintColor,
              text: LocaleKeys.tab_saveAndControl.tr(),
              textStyle: context.textTheme.displaySmall!.copyWith(
                fontSize: 12,
              ),
              onTap: () {
                isReadyForSale.value = false;
                pageController.jumpToPage(0);
              },
            ),
          ),
          Expanded(
            child: CustomButton(
              height: 30,
              text: LocaleKeys.tab_getReadyForSale.tr(),
              color: value ? AppColors.defaultDark : AppColors.unselectedButton,
              textColor: value ? AppColors.white : AppColors.hintColor,
              textStyle: context.textTheme.displaySmall!.copyWith(
                fontSize: 12,
              ),
              onTap: () {
                isReadyForSale.value = true;
                pageController.jumpToPage(1);
              },
            ),
          )
        ],
      ),
    );
  }
}
