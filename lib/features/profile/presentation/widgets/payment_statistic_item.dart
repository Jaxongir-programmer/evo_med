import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class PaymentStatisticItem extends StatelessWidget {
  const PaymentStatisticItem({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.iconBGColor,
    required this.bgColor,
  });

  final String title;
  final String amount;
  final String icon;
  final Color iconBGColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        spacing: 16,
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: iconBGColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: icon.toSVGWidget(color: AppColors.white),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
              ),
              Text(
                LocaleKeys.label_uzs.tr(args: [amount]),
                style: context.textTheme.labelLarge!.copyWith(fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
