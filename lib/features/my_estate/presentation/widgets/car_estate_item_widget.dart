import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/my_estate/presentation/widgets/estate_item_row_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class CarEstateItemWidget extends StatelessWidget {
  const CarEstateItemWidget({
    super.key,
  });

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
                "Lacetti, 01 F345 CV",
                style: context.textTheme.displaySmall,
              ),
              // Spacer(),
              // GestureDetector(
              //   onTap: () {
              //     // context.pushNamed(AppRouter.myEstateDetail);
              //   },
              //   behavior: HitTestBehavior.opaque,
              //   child: Text(
              //     LocaleKeys.btn_inDetail.tr(),
              //     style: context.textTheme.displaySmall!.copyWith(color: AppColors.primaryColor, fontSize: 16),
              //   ),
              // )
            ],
          ),
          Gap(24),
          EstateItemRowWidget(
            icon: AppIcons.color,
            title: LocaleKeys.title_color.tr(),
            label: "Qora",
          ),
          Divider(color: AppColors.dividerColor, height: 25),
          EstateItemRowWidget(
            icon: AppIcons.calendar,
            title: LocaleKeys.title_dateOfIssue.tr(),
            label: "2022",
          ),
          Divider(color: AppColors.dividerColor, height: 25),
          EstateItemRowWidget(
            icon: AppIcons.motor,
            title: LocaleKeys.title_engine.tr(),
            label: "IU875667576",
          ),
          Divider(color: AppColors.dividerColor, height: 25),
          EstateItemRowWidget(
            icon: AppIcons.numberShass,
            title: LocaleKeys.title_shassiNumber.tr(),
            label: "324 4234 543",
          ),
          Divider(color: AppColors.dividerColor, height: 25),
          EstateItemRowWidget(
            icon: AppIcons.calendar,
            title: LocaleKeys.title_dateOfRegistration.tr(),
            label: "12.02.2002",
          ),
          Gap(24),
          Row(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIcons.circleWarning.toSVGWidget(),
              Expanded(
                child: Text(
                  LocaleKeys.label_soonCarRent.tr(),
                  style: context.textTheme.labelMedium,
                ),
              )
            ],
          ),
          Gap(16),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  height: 40,
                  onTap: () {},
                  text: LocaleKeys.btn_putForSale.tr(),
                ),
              ),
              Gap(16),
              Expanded(
                child: CustomButton(
                  height: 40,
                  isDisabled: true,
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
