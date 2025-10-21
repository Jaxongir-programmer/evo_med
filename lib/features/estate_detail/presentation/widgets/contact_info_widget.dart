import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/estate_detail_item_widget.dart';
import 'package:evo_med/features/estate_detail/presentation/dialog/buy_package_dialog.dart';
import 'package:evo_med/features/estate_detail/presentation/widgets/copy_phone_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    super.key,
    required this.phoneNumber,
    required this.regionDistrict,
    required this.address,
    required this.estateDetailInfo,
  });

  final String phoneNumber;
  final String regionDistrict;
  final String address;
  final String estateDetailInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(24),
        Text(
          LocaleKeys.title_numberForContact.tr(),
          style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
        ),
        Gap(16),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.containerBloc,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CopyPhoneItemWidget(phoneNumber: phoneNumber),
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_regionDistrict.tr(),
                    label: regionDistrict,
                  ),
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_address.tr(),
                    label: address,
                  ),
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_estateDetailInfo.tr(),
                    label: estateDetailInfo,
                  ),
                ],
              ),
            ),
            ContactHideWidget(),
          ],
        ),
      ],
    );
  }
}

class ContactHideWidget extends StatelessWidget {
  const ContactHideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackground.withValues(alpha: .4),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: IntrinsicWidth(
              child: CustomButton(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                color: AppColors.white,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      // return FreeTrialDialog();
                      // return LimitChargeDialog();
                      return BuyPackageDialog();
                    },
                  );
                },
                child: Row(
                  spacing: 8,
                  children: [
                    AppIcons.eyeContact.toSVGWidget(),
                    Text(LocaleKeys.btn_openDetails.tr(), style: context.textTheme.headlineSmall)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}