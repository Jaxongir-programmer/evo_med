import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class PaymentTypeItem extends StatelessWidget {
  const PaymentTypeItem({
    super.key,
    required this.type,
    required this.onCheckTap,
    required this.title,
    required this.amount,
    required this.time,
    required this.cardNumber,
    this.announceNumber,
  });

  final PaymentHistoryType type;
  final Function() onCheckTap;
  final String title;
  final String? announceNumber;
  final String amount;
  final String time;
  final String cardNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: bgColor(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              typeText(),
              style: context.textTheme.headlineMedium!.copyWith(color: textColor()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (type.isExpense)
                Text(
                  LocaleKeys.label_announceId.tr(args: [title]),
                  style: context.textTheme.headlineMedium!.copyWith(decoration: TextDecoration.underline),
                )
              else
                Text(
                  title,
                  style: context.textTheme.headlineMedium,
                ),
              Text(
                LocaleKeys.label_uzs.tr(args: [amount]),
                style: context.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppIcons.clockFive.toSVGWidget(color: AppColors.labelColor, size: 14),
              Gap(4),
              Text(
                time,
                style: context.textTheme.labelMedium!.copyWith(
                  color: AppColors.labelColor,
                ),
              ),
              Gap(8),
              Text(
                cardNumber,
                style: context.textTheme.labelMedium!.copyWith(
                  color: AppColors.labelColor,
                ),
              ),
              Spacer(),
              CustomButton.transparent(
                height: 30,
                isDisabled: type.isReserve,
                padding: EdgeInsets.only(left: 16),
                onTap: onCheckTap,
                text: type.isReserve ? announceNumber ?? "" : LocaleKeys.btn_receiveCheck.tr(),
              )
            ],
          ),
        ],
      ),
    );
  }

  String typeText() => type.isExpense
      ? LocaleKeys.title_expenses.tr()
      : type.isIncome
      ? LocaleKeys.title_income.tr()
      : LocaleKeys.title_reserved.tr();

  Color textColor() => type.isExpense
      ? AppColors.error
      : type.isIncome
      ? AppColors.successGreen
      : AppColors.badgeColor;

  Color bgColor() => type.isExpense
      ? AppColors.buttonPrimaryLight
      : type.isIncome
      ? AppColors.bgSuccess
      : AppColors.reservedBG;
}
