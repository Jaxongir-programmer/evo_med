import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/insufficient_balance_widget.dart';
import 'package:evo_med/features/estate_detail/presentation/dialog/buying_tariff_bottom_sheet.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class TariffItemWidget extends StatefulWidget {
  const TariffItemWidget({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.onTap,
    this.hasTariffLimit = false,
  });

  final int id;
  final int price;
  final String name;
  final String description;
  final VoidCallback onTap;
  final bool hasTariffLimit;

  @override
  State<TariffItemWidget> createState() => _TariffItemWidgetState();
}

class _TariffItemWidgetState extends State<TariffItemWidget> {
  bool inSufficientBalance = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.containerBloc,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Column(
        spacing: 24,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: AppColors.white,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(widget.name, style: context.textTheme.displaySmall!.copyWith(fontSize: 16)),
                    Text(
                      widget.description,
                      style: context.textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      LocaleKeys.label_sumPerMonth.tr(args: [widget.price.priceFormat(), "1"]),
                      style: context.textTheme.displaySmall?.copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
          if (!widget.hasTariffLimit)
            CustomButton(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  builder: (context) {
                    return BuyingTariffBottomSheet(
                      price: widget.price,
                      tariffId: widget.id,
                    );
                  },
                ).then(
                  (value) {
                    if (value == "insufficient") {
                      setState(() {
                        inSufficientBalance = true;
                      });
                    }
                  },
                );
              },
              text: LocaleKeys.btn_buy.tr(),
            ),
          if (inSufficientBalance) ...[
            InsufficientBalanceWidget(
              onTop: () {},
            ),
          ]
        ],
      ),
    );
  }
}
