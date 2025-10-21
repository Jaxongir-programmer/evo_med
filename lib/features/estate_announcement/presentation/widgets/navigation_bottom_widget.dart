import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class NavigationBottomWidget extends StatelessWidget {
  const NavigationBottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16).copyWith(bottom: context.padding.bottom + 8),
      decoration: BoxDecoration(color: AppColors.borderColor.withOpacity(.5)),
      child: Row(
        spacing: 8,
        children: [
          CustomButton.border(
            onTap: () {
              context.pushNamed(AppRouter.searchFromMap);
            },
            height: 40,
            child: Row(
              spacing: 8,
              children: [
                AppIcons.location.toSVGWidget(),
                Text(
                  LocaleKeys.btn_searchFromMap.tr(),
                  style: context.textTheme.headlineMedium!.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          CustomButton(
            onTap: () {},
            height: 40,
            color: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.label_currentBalance.tr(),
                  style: context.textTheme.labelSmall!.copyWith(
                    color: AppColors.labelColor,
                  ),
                ),
                Text("40 000 so'm", style: context.textTheme.headlineSmall),
              ],
            ),
          ),
          CustomButton(
            onTap: () {},
            height: 40,
            width: 40,
            color: AppColors.white,
            child: AppIcons.message.toSVGWidget(),
          ),
        ],
      ),
    );
  }
}
