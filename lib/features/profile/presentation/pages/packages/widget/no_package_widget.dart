import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class NoPackageTitle extends StatelessWidget {
  const NoPackageTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.buttonPrimaryLight,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Row(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcons.info.toSVGWidget(),
          Text(LocaleKeys.title_youHaveNoPackage.tr(), style: context.textTheme.bodyLarge),
        ],
      ),
    );
  }
}
