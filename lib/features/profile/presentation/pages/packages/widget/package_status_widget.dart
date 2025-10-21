import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class PackageStatusWidget extends StatelessWidget {
  const PackageStatusWidget({
    super.key,
    required this.tariffName,
    required this.validityPeriod,
    required this.availableLimit,
    required this.allLimit,
  });

  final String tariffName;
  final String validityPeriod;
  final int availableLimit;
  final int allLimit;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.title_yourPackages.tr(), style: context.textTheme.displaySmall),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.containerBloc,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 24,
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: AppColors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(LocaleKeys.title_packageType.tr(args: [tariffName]), style: context.textTheme.displaySmall),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: availableLimit.priceFormat(),
                        style: context.textTheme.displayLarge!.copyWith(color: AppColors.labelColor),
                      ),
                      TextSpan(
                        text: " / ",
                        style: context.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: allLimit.priceFormat(),
                        style: context.textTheme.displayLarge!,
                      )
                    ]),
                  ),
                  Text(
                    LocaleKeys.label_availableLimit.tr(),
                    style: context.textTheme.labelLarge!.copyWith(color: AppColors.labelColor),
                  ),
                ],
              )
            ],
          ),
        ),
        Text(
          LocaleKeys.label_validityPeriod.tr(
            args: [validityPeriod],
          ),
          style: context.textTheme.labelMedium!.copyWith(color: AppColors.labelColor),
        )
      ],
    );
  }
}
