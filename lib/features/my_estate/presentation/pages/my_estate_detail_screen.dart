import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/estate_detail_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class MyEstateDetailScreen extends StatefulWidget {
  const MyEstateDetailScreen({super.key});

  @override
  State<MyEstateDetailScreen> createState() => _MyEstateDetailScreenState();
}

class _MyEstateDetailScreenState extends State<MyEstateDetailScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        title: Text(
          LocaleKeys.title_estateDetailInfo.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
          bottom: context.padding.bottom,
        ),
        children: [
          Gap(8),
          Text(
            LocaleKeys.title_generalInfo.tr(),
            style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
          ),
          Gap(16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EstateDetailItemWidget(
                  title: LocaleKeys.title_estateType.tr(),
                  label: "Kvartira",
                ),
                Divider(height: 25),
                EstateDetailItemWidget(
                  title: LocaleKeys.title_cadastralNumber.tr(),
                  label: "12:34:23:54:76:23",
                ),
                Divider(height: 25),
                EstateDetailItemWidget(
                  title: LocaleKeys.title_area.tr(),
                  label: "91.71 m²",
                ),
                Divider(height: 25),
                EstateDetailItemWidget(
                  title: LocaleKeys.title_address.tr(),
                  label: "Toshkent viloyati, Toshkent shaxri, Yashnobod tumani, Buyuk turon ko’chasi, 33-uy 4-xonadon",
                ),
              ],
            ),
          ),
          Gap(40),
          Text(
            LocaleKeys.title_communalPaymentInfo.tr(),
            style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
          ),
          Gap(16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommunalPayInfoItemWidget(
                  title: "Elektr",
                  accountNumber: "123456789",
                  amount: 100000,
                ),
                Divider(height: 25),
                CommunalPayInfoItemWidget(
                  title: "Gaz",
                  accountNumber: "123456789",
                  amount: -100000,
                ),
                Divider(height: 25),
                CommunalPayInfoItemWidget(
                  title: "Suv",
                  accountNumber: "123456789",
                  amount: 100000,
                ),
                Divider(height: 25),
                CommunalPayInfoItemWidget(
                  title: "Chiqindi",
                  accountNumber: "123456789",
                  amount: -40000,
                ),
                Gap(24),
                CustomButton(
                  isDisabled: true,
                  onTap: () {},
                  text: LocaleKeys.btn_pay.tr(args: ["(Tez kunda)"]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CommunalPayInfoItemWidget extends StatelessWidget {
  const CommunalPayInfoItemWidget({
    super.key,
    required this.title,
    required this.accountNumber,
    required this.amount,
  });

  final String title;
  final String accountNumber;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          title,
          style: context.textTheme.bodyLarge!.copyWith(fontSize: 18),
        ),
        Text(
          LocaleKeys.label_accountNumber.tr(args: [accountNumber]),
          style: context.textTheme.labelMedium!.copyWith(
            color: AppColors.labelColor,
          ),
        ),
        Gap(4),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            LocaleKeys.label_uzs.tr(args: [amount.priceFormat()]),
            style: context.textTheme.headlineMedium!.copyWith(
              color: amount.isNegative ? AppColors.error : null,
            ),
          ),
        ),
      ],
    );
  }
}
