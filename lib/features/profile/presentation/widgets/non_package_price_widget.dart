import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class NonPackagePriceWidget extends StatelessWidget {
  const NonPackagePriceWidget({
    super.key,
    required this.nonTariffPrice,
  });

  final int nonTariffPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.containerBloc,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Text(
              LocaleKeys.title_nonePackagePrice.tr(),
              style: context.textTheme.bodyMedium,
            ),
          ),
          Gap(32),
          Text(
            LocaleKeys.label_uzs.tr(
              args: [
                nonTariffPrice.priceFormat(),
              ],
            ),
            style: context.textTheme.displaySmall?.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
