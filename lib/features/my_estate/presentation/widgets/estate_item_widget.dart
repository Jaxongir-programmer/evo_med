import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/my_estate/presentation/widgets/estate_item_row_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class EstateItemWidget extends StatelessWidget {
  const EstateItemWidget({
    super.key,
    this.forRegion = false,
  });

  final bool forRegion;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.containerBloc,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Ko’p qavatli turar joy",
                style: context.textTheme.displaySmall,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouter.myEstateDetail);
                },
                behavior: HitTestBehavior.opaque,
                child: Text(
                  LocaleKeys.btn_inDetail.tr(),
                  style: context.textTheme.displaySmall!.copyWith(color: AppColors.primaryColor, fontSize: 16),
                ),
              )
            ],
          ),
          Gap(24),
          EstateItemRowWidget(
            icon: AppIcons.map,
            title: LocaleKeys.title_regionDistrict.tr(),
            label: "Toshkent shaxri, Yunusobod tumani",
          ),
          Divider(color: AppColors.dividerColor, height: 25),
          EstateItemRowWidget(
            icon: AppIcons.area,
            title: LocaleKeys.title_area.tr(),
            label: "92 m²",
          ),
          Divider(color: AppColors.dividerColor, height: 25),
          EstateItemRowWidget(
            icon: AppIcons.address,
            title: LocaleKeys.title_address.tr(),
            label: "Buyuk turon ko’chasi, 33-uy 4-xonadon",
          ),
          Gap(24),
          if (forRegion) ...[
            Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppIcons.circleWarning.toSVGWidget(),
                Expanded(
                  child: Text(
                    LocaleKeys.label_soonStateForRegions.tr(),
                    style: context.textTheme.labelMedium,
                  ),
                )
              ],
            ),
            Gap(16)
          ],
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  isDisabled: forRegion,
                  height: 40,
                  onTap: () {},
                  text: LocaleKeys.btn_putForSale.tr(),
                ),
              ),
              Gap(16),
              Expanded(
                child: CustomButton(
                  isDisabled: forRegion,
                  height: 40,
                  onTap: () {},
                  text: LocaleKeys.btn_toRent.tr(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
