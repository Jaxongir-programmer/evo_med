import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class IdentifyWidget extends StatelessWidget {
  const IdentifyWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.price,
    required this.buttonText,
  });

  final Function() onTap;
  final String buttonText;
  final String price;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.containerBloc,
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(32),
          icon.toSVGWidget(),
          Gap(16),
          Text(
            LocaleKeys.label_downloadInfo.tr(),
            style: context.textTheme.bodyLarge!.copyWith(
              color: AppColors.labelColor,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(48),
          IntrinsicWidth(
            child: CustomButton(
              onTap: onTap,
              height: 40,
              borderRadius: 20,
              text: buttonText,
              padding: EdgeInsets.symmetric(horizontal: 24),
            ),
          ),
          Gap(16),
          Text(
            LocaleKeys.label_downloadPrice.tr(args: [price]),
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Gap(12),
          Text(
            LocaleKeys.label_announce10Day.tr(),
            style: context.textTheme.labelMedium!.copyWith(color: AppColors.labelColor),
            textAlign: TextAlign.center,
          ),
          Gap(32),
        ],
      ),
    );
  }
}
