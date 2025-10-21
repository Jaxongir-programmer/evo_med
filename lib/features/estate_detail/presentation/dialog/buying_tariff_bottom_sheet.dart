import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class BuyingTariffBottomSheet extends StatelessWidget {
  const BuyingTariffBottomSheet({
    super.key,
    required this.price,
    required this.tariffId,
  });

  final int price;

  final int tariffId;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: LocaleKeys.title_attention.tr(),
      onLeadingTap: () {
        context.pop();
      },
      controlWidget: CustomButton(
        text: LocaleKeys.btn_confirm.tr(),
        onTap: () {
          context.pop("insufficient");
          // context.read<TariffsBloc>().add(BuyTariffEvent(tariffId: tariffId));
        },
      ),
      content: ListView(
        shrinkWrap: true,
        children: [
          Gap(24),
          LocaleKeys.label_willChargeFromBalance.tr().toStyle(
            style: context.textTheme.bodyLarge!,
            defStyle: context.textTheme.displaySmall!,
            args: [price.priceFormat()],
          ),
        ],
      ),
    );
  }
}
